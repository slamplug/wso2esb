# === Class: wso2esb
#
# Installs and configures instances of DES Enterprise Service Bus 
#
# === Parameters
#
# The following parameters are mandatory for this Class:
# 
# [*ensure*]
#   present or absent - applies to entire install
#
# [*instances*]
#   Map that defines the ESB instances that will be installed on this host.
#   Data structure contains name/value pairs
#     instance_name
#       ensure
#       des_package_name
#       tier
#       subdomain
#       server_name
#       wso2_domain
#       wso2_user
#       wso2_group
#       mgt_host
#       offset
#       hazelcast_port
#       cluster_members
#       rabbitmq_host
#       rabbitmq_port
#       rabbitmq_username
#       rabbitmq_password
#
#   And names correspond to
#     ensure                    [optional, defaults to present]
#     des_package_name          [mandatory value, des package name]
#     tier                      [mandatory value, valid values 'data|corp']
#     subdomian                 [mandatory value, valid values 'mgt|worker']
#     server_name               [mandatory value]
#     wso2_domain               [optional, if not supplied is calculated]
#     wso2_user                 [optional, if not supplied defaults to deslive]
#     wso2_group                [optional, if not supplied defaults to des]
#     mgt_host                  [optional, if not supplied is calculated]
#     offset                    [optional, if not supplied is calculated]
#     hazelcast_port            [optional, if not supplied is calculated]
#     cluster_members           [optional, if not supplied is calculated]
#     rabbitmq_host             [optional, if not supplied defults to 
#                                          'desbkr01-vip']
#     rabbitmq_port             [optional, if not supplied defults to 
#                                 '5672' for data tier, 
#                                 '6672' for corp tier]
#     rabbitmq_username         [optional, if not supplied defults to 
#                                  'wso2_rabbit_data' for data tier, 
#                                  'wso2_rabbit_corp' for corp tier]
#     rabbitmq_password         [optional, if undef rabbit not configured]
#
#    All optional values with the exception of rabbit_server_creds (if 
#    not supplied) have defaults calculated based on server_name tier 
#    and subdomain.
#
# [*data_volume_group*]
#   Specifies the Volume Group for WSO2 installation.
#
#   Defaults to wso2esb::params::log_volume_group
#
# [*data_mount_size*]
#   Specifies the Mount Point Size for the Data Directory.
#
#   Defaults to the value in wso2esb::params::data_mount_size.
#
# [*log_volume_group*]
#   Specifies the Volume Group for the Logs Directory.
#
#   Defaults to wso2esb::params::log_volume_group
#
# [*log_size*]
#   Specifies the Mount Point Size for the Logs Directory.
#
#   Defaults to the value in wso2esb::params::log_size
#
# === Examples
#
#  To configure in hieara (manager only on host using defaults)
#
# ---
# classes:
#   - wso2esb
#
# wso2esb::ensure: present
# wso2esb::instances:
#  desesb01m:
#    ensure: present
#    des_package_name: desesb-data-4.8.1_1.0.0
#    tier: data
#    subdomain: mgt
#    server_name: desesb01m
#
#  To configure in hieara (manager and 2 x workers on host)
#
# ---
# classes:
#   - wso2esb
#
# wso2esb::ensure: present
# wso2esb:instances:
#  desesb01m:
#    ensure: present
#    des_package_name: desesb-data-4.8.1_1.0.0
#    tier: data
#    subdomain: mgt
#    server_name: desesb01m
#    offset: 12
#    hazelcast_port: 4020
#    cluster_members:
#      desesb01a: 4021
#      desesb01b: 4022
#  desesb01a:
#    ensure: present
#    des_package_name: desesb-data-4.8.1_1.0.0
#    tier: data
#    subdomain: worker
#    server_name: desesb01a
#    offset: 2
#    hazelcast_port: 4021
#    cluster_members:
#      desesb01m: 4020
#  desesb01b:
#    ensure: present
#    des_package_name: desesb-data-4.8.1_1.0.0
#    tier: data
#    subdomain: worker
#    server_name: desesb01b
#    offset: 2
#    hazelcast_port: 4022
#    cluster_members:
#      desesb01m: 4020
#
# === Authors
#
# Author Name Simon Lamplugh
#
class wso2esb (

  $ensure                 = present,
  $instances,
  $wso2_version           = $wso2esb::params::wso2_version,
  $des_root               = $wso2esb::params::des_root,
  $wso2_user              = $wso2esb::params::wso2_user,
  $wso2_group             = $wso2esb::params::wso2_group,
  $physical_volumes       = $wso2esb::params::physical_volumes,
  $lv_group               = $wso2esb::params::lv_group,
  $data_lv_name           = $wso2esb::params::data_lv_name,
  $data_size              = $wso2esb::params::data_size,
  $log_lv_name            = $wso2esb::params::log_lv_name,
  $log_size               = $wso2esb::params::log_size,
  $des_logs_root          = $wso2esb::params::des_logs_root

) inherits wso2esb::params {

  # default values
  $defaults = {
    'ensure'        => $ensure,
    'des_root'      => $des_root,
    'apache_user'   => $wso2esb::params::apache_user,
    'apache_group'  => $wso2esb::params::apache_group,
    'apache_port'   => $wso2esb::params::apache_port,
    'svn_username'  => $wso2esb::params::svn_username,
    'svn_password'  => $wso2esb::params::svn_password,
    'wso2_version'  => $wso2_version,
    'wso2_user'     => $wso2_user,
    'wso2_group'    => $wso2_group,
  }

  # Check whether this is to make present or absence because of the sequence
  if $ensure == 'present' {

    common::local_groups { $wso2_group:
      ensure => present,
      system => true,
    }
    ->
    common::local_users { $wso2_user:
      ensure          => present,
      service_account => true,
      comment         => "Service account for ${wso2_user}",
      gid             => $wso2_group,
      force_password  => true,
    }
    ->
    file { [
      $des_logs_root, ]:
      ensure => 'directory',
      owner  => $wso2_user,
      group  => $wso2_group,
      mode   => '0755',
    }
    ->
    lvm::logical_volume { $log_lv_name:
      ensure       => 'present',
      volume_group => $lv_group,
      size         => $log_size,
      mountpath    => '/var/log/des',
    }

    create_resources('wso2esb::instance', $wso2esb::instances, $defaults)

  } else { # absent so remove everything
  
    create_resources('wso2esb::instance', $wso2esb::instances, $defaults)

    lvm::logical_volume { $log_lv_name:
      ensure       => 'absent',
      volume_group => $lv_group,
      force        => true
    }
  }
}
