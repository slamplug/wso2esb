# === Define: wso2esb::instance
#
# Installs and configures the DES Enterprise Service Bus.
#
# === Parameters
#
# The following parameters are mandatory for this Class:
#
# [*ensure*]
#   Defines whether the resource should be "present" or "absent"
#
# [*wso2_version*]
#   WSO2 product release version
#
# [*des_package_name*]
#   DES package name
#
# [*des_root*]
#   DES root install directory
#
# [*tier*]
#   'data' or 'corp'
#
# [*subdomain*]
#   'mgt' or 'worker'
#
# [*server_name*]
#   server name
#
# [wso2_user]
#   The wso2 user
#
# [wso2_group]
#   The wso2 group
#
# [*deployment_synch_enabled*]
#  Enable wso2 svn based deployment synchronisation (default true)
#
# [*apache_user*]
#   Apache user
#
# [*apache_group*]
#   Apache group
#
# [*apache_port*]
#   Port apache should listen on
#
# [*svn_username*]
#  SVN username
#
# [*svn_password*]
#  SVN password
#
# [*svn_repo_name*]
#  Name of SVN repository
#
# The following parameters are optional parameters (default values are either 
# taken from wso2esb::params or calculated based on tier, subdomain and
# server name values. Default values are current production settings. ):
#
# [wso2_domain]
#   The wso2 domain name
#
# [mgt_host]
#   Management console hostname. 
#
# [offset]
#   Carbon port offset. 
#
# [hazelcast_port]
#   Hazelcast cluster communication port. 
#
# [cluster_members]
#   cluster members hash
#
# [rabbitmq_host]
#   rabbit mq hostname, defaults to desbkr01-vip
#
# [rabbitmq_port]
#   rabbit mq port number, defaults to 5672 (data) or 6672 (corp)
#
# [rabbitmq_username]
#   rabbit mq username, defaults to wso2_rabbit_data or wso2_rabbit_corp
#
# [rabbitmq_password]
#   rabbit mq password, if supplied server is configured with rabbit mq
#
# [ensure_service]
#   service state (running or stopped), defaults as running
#
# === Examples
#
# wso2esb::instance { 'wso2esb::instance':
#    ensure                   => 'present'
#    wso2_version             => '4.8.1'
#    des_package_name         => 'desesb-data-4.8.1_1.0.0'
#    des_root                 => '/opt/app/des'
#    tier                     => 'data'
#    subdomain                => 'worker'
#    server_name              => 'desesb01a'
#    wso2_domain              => 'desesb01.wso2.domain'
#    wso2_user                => 'deslive'
#    wso2_group               => 'des'
#    mgt_host                 => 'localhost'
#    offset                   =>  6
#    hazelcast_port           => 4021
#    cluster_members          => { 'desesb01m' => 4020 }
#    deployment_synch_enabled => true,
#    apache_user              => 'apache'
#    apache_group             => 'apache'
#    apache_port              => '10080'
#    svn_username             => 'svn'
#    svn_password             => 'password'
#    svn_repo_name            => 'depsync'
# }
#
# === Authors
#
# Simon Lamplugh <simon.lamplugh@hmrcaspire.com
#
define wso2esb::instance (

  $ensure                   = undef,
  $wso2_version             = undef,
  $des_package_name         = undef,
  $des_root                 = undef,
  $tier                     = undef,
  $subdomain                = undef,
  $server_name              = undef,
  $wso2_user                = undef,
  $wso2_group               = undef,
  $wso2_domain              = undef,
  $deployment_synch_enabled = true,
  $apache_user              = undef,
  $apache_group             = undef,
  $apache_port              = undef,
  $svn_username             = undef,
  $svn_password             = undef,
  $mgt_host                 = undef,
  $offset                   = undef,
  $hazelcast_port           = undef,
  $cluster_members          = undef,
  $rabbitmq_host            = 'desbkr01-vip',
  $rabbitmq_port            = $tier ? { 'data' => 5672, 
                                'corp' => 6672, 
                                default => 9999 },
  $rabbitmq_username        = $tier ? { 'data' => 'wso2_rabbit_data',
                                'corp' => 'wso2_rabbit_corp', 
                                default => '' },
  $rabbitmq_password        = undef,
  $ensure_service           = 'running',
  $db_type                  = 'oracle'

)  {

  include stdlib

  # check mandatory parameters. If not supplied fail.
  if $des_package_name == undef {
    fail("'des_package_name' must be defined e.g. desesb-data-4.8.1_1.0.0")
  }
  if $tier == undef or !($tier in ['data','corp']) {
    fail("'tier' not defined or not in [data|corp]")
  }
  if $subdomain == undef or !($subdomain in ['mgt','worker']) {
    fail("'subdomain' not defined or not in [mgt|worker]")
  }
  if $ensure == 'present' and $server_name == undef {
    fail("'server_name' must be defined e.g. desesb01a")
  }

  # calculate the directory into which the product will be installed
  $product_root = "${des_root}/${server_name}"

  # calculate some variables
  $package_url         = "http://repomirror/Capgemini/Packages/${des_package_name}.rpm"
  $upcase_env          = upcase($env)
  $config_db           = chop($server_name)
  $p_svn_url           = $deployment_synch_enabled ? { 
                           true => "http://${config_db}m:${apache_port}/svn/${config_db}",
                           default => 'http://svnrepo.example.com/repos/', }
  $svn_autocommit      = $deployment_synch_enabled ? { 
                           true => $subdomain ? { 'mgt' => true, 'worker' => false, },
                           default => 'false', }
  $p_svn_username      = $deployment_synch_enabled ? { true => $svn_username, default => 'username', }
  $p_svn_password      = $deployment_synch_enabled ? { true => $svn_password, default => 'password', }
  $logs_directory      = "/var/log/des/${server_name}"
  $clustering_enabled  = $deployment_synch_enabled

  # Check whether this is to make present or absence because of the sequence
  if $ensure == 'present' {
    
    file { $product_root:
      ensure => 'directory',
      owner  => $wso2_user,
      group  => $wso2_group,
    }->
    package { $des_package_name:
      ensure          => 'present',
      source          => $package_url,
      provider        => 'rpm',
      install_options => [ { '--prefix' => $product_root } ],
      require         => File[$product_root],
    }->
    file { [
      "${product_root}/repository",
      "${product_root}/repository/carbonapps",
      "${product_root}/repository/carbonapps/work",
      "${product_root}/custom_resources",
      "${product_root}/custom_resources/properties"  ]:
      ensure => 'directory',
      owner  => $wso2_user,
      group  => $wso2_group,
      mode   => '0755',
    }->
    exec { "set-ownership-${product_root}":
      path      => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      command   => "chown -R ${wso2_user}:${wso2_group} ${product_root} && chmod -R 755 ${product_root}",
      logoutput => 'on_failure',
      timeout   => 0,
      require   => [
        Package[$des_package_name],
        File[ "${product_root}/custom_resources/properties" ]
      ]
    }->
    file { $logs_directory:
      ensure => 'directory',
      owner  => $wso2_user,
      group  => $wso2_group,
    }->
    file { "${product_root}/repository/logs":
      ensure  => 'link',
      target  => $logs_directory,
      require  => File[$product_root];
    }

    # Calculate defaults for platform config
  
    $p_wso2_domain = $wso2_domain ? {
      undef => calc_wso2_domain($server_name),
      default => $wso2_domain
    }
    $p_serverroles = $tier ? {
      'data' => [
        'EnterpriseServiceBus',
        'GREG_DATA',
        'ESB_DATA'
      ],
      'corp' => [
        'EnterpriseServiceBus',
        'GREG_CORP',
        'ESB_CORP',
        'GovernanceRegistry'
      ],
    }
    $p_offset = $offset ? {
      undef => calc_offset($tier, $subdomain),
      default => $offset,
    }
    $p_mgt_host = $mgt_host ? {
      undef => calc_mgmt_host($server_name),
      default => $mgt_host,
    }
    $p_hazelcast_port = $hazelcast_port ? {
      undef => calc_hazelcast_port($server_name),
      default => $hazelcast_port
    }
    $p_members = $cluster_members ? {
      undef => calc_cluster_members($tier, $subdomain),
      default => $cluster_members
    }
    $wso2_registry_data_source = $tier ? { 
      'data' => $subdomain ? { 'mgt' => 'WSO2CarbonDB', default => 'WSO2_SHARED_DB' }, 
      'corp' => 'WSO2CarbonDB'
    }
    $shared_registry_data_source ='WSO2GREG_DB'
    $user_manager_data_source = $tier ? {
      'data' => 'WSO2_SHARED_DB', 
      'corp' => 'WSO2UM_DB'
    }
    $enable_transports_in_axis2 = $subdomain ? { 
      'mgt' => 'false', default => 'true'
    }

    # Apply configuration
  
    file { "/etc/rc.d/init.d/${server_name}":
      ensure  => present,
      mode    => '0755',
      content => template('wso2esb/etc/rc.d/init.d/service.erb'),
      require => Package[$des_package_name],
    }
    service{ $server_name:
      ensure  => $ensure_service,
      enable  => true,
      require => File["/etc/rc.d/init.d/${server_name}"],
    }
    file { "${product_root}/repository/conf/carbon.xml":
      ensure  => present,
      owner   => $wso2_user,
      group   => $wso2_group,
      mode    => '0755',
      content => template('wso2esb/conf/carbon.xml.erb'),
      notify  => Service[$server_name],
    }
    file { "${product_root}/repository/conf/axis2/axis2.xml":
      ensure  => present,
      owner   => $wso2_user,
      group   => $wso2_group,
      mode    => '0755',
      content => template('wso2esb/conf/axis2/axis2.xml.erb'),
      notify  => Service[$server_name],
    }
    file { "${product_root}/repository/conf/datasources/master-datasources.xml":
      ensure  => present,
      owner   => $wso2_user,
      group   => $wso2_group,
      mode    => '0755',
      content => template('wso2esb/conf/datasources/master-datasources.xml.erb'),
      notify  => Service[$server_name],
    }
    file { "${product_root}/repository/conf/registry.xml":
      ensure  => present,
      owner   => $wso2_user,
      group   => $wso2_group,
      mode    => '0755',
      content => template('wso2esb/conf/registry.xml.erb'),
      notify  => Service[$server_name],
    }
    file { "${product_root}/repository/conf/user-mgt.xml":
      ensure  => present,
      owner   => $wso2_user,
      group   => $wso2_group,
      mode    => '0755',
      content => template('wso2esb/conf/user-mgt.xml.erb'),
      notify  => Service[$server_name],
    }
    file { "${product_root}/repository/conf/log4j.properties":
      ensure  => present,
      owner   => $wso2_user,
      group   => $wso2_group,
      mode    => '0755',
      content => template('wso2esb/conf/log4j.properties.erb'),
      notify  => Service[$server_name],
    }

  } else { # absent so remove everything
  
    service{ $server_name:
      ensure => stopped,
      enable => false,
    }->
    file { "/etc/rc.d/init.d/${server_name}":
      ensure => absent,
    }
    package { $des_package_name:
      ensure   => 'absent',
      provider => 'rpm';
    }->
    file { $product_root:
      ensure => 'absent',
      force  => true,
    }
  }
}
