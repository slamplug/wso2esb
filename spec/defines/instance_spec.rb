require 'spec_helper'
describe 'wso2esb::instance', :type => :define do

  #
  # Test parameter validation
  #
  
  #context 'test failure message when rpm_version not supplied' do
  #  let(:title) { 'wso2esb instances install' }
  #  let(:params) { {:ensure => 'present',
  #                  :wso2_version => '4.8.1',
  #                  #:des_package_name => 'desesb-data-4.8.1_1.0.0',
  #                  :des_root => '/opt/app/des',
  #                  :tier => 'data',
  #                  :subdomain => 'mgt',
  #                  :server_name => 'desesb01m',
  #                  :wso2_domain => 'desesb01.wso2.domain',
  #                  :wso2_user => 'deslive',
  #                  :wso2_group => 'des',
  #                  :mgt_host => 'desesb01m-mgmt',
  #                  :offset => '12',
  #                  :hazelcast_port => '4020',
  #                  :cluster_members => { 'desesb01m' => '4020' },
  #                  :apache_user => 'apache',
  #                  :apache_group => 'apache',
  #                  :apache_port => '10800',
  #                  :svn_username => 'svn',
  #                  :svn_password => 'svnpass'
  #               } }
  #  it do
  #    expect {
  #      should compile
  #    }.to raise_error(Puppet::Error, /'des_package_name' must be defined/)
  #  end
  #end

  #context 'test failure message when tier not supplied' do
  # let(:title) { 'wso2esb instances install' }
  # let(:params) { {:ensure => 'present',
  #                 :wso2_version => '4.8.1',
  #                 :des_package_name => 'desesb-data-4.8.1_1.0.0',
  #                 :des_root => '/opt/app/des',
  #                 #:tier => 'data',
  #                 :subdomain => 'mgt',
  #                 :server_name => 'desesb01m',
  #                 :wso2_domain => 'desesb01.wso2.domain',
  #                 :wso2_user => 'deslive',
  #                 :wso2_group => 'des',
  #                 :mgt_host => 'desesb01m-mgmt',
  #                 :offset => '12',
  #                 :hazelcast_port => '4020',
  #                 :cluster_members => { 'desesb01m' => '4020' },
  #                 :apache_user => 'apache',
  #                 :apache_group => 'apache',
  #                 :apache_port => '10800',
  #                 :svn_username => 'svn',
  #                 :svn_password => 'svnpass'
  #              } }
  # it do
  #   expect {
  #     should compile
  #   }.to raise_error(Puppet::Error, /'tier' not defined or not in /)
  # end
  #end 
  
  #context 'test failure message when tier not correct value' do
  #  let(:title) { 'wso2esb instances install' }
  #  let(:params) { {:ensure => 'present',
  #                  :wso2_version => '4.8.1',
  #                  :des_package_name => 'desesb-data-4.8.1_1.0.0',
  #                  :des_root => '/opt/app/des',
  #                  :tier => 'wibble',
  #                  :subdomain => 'mgt',
  #                  :server_name => 'desesb01m',
  #                  :wso2_domain => 'desesb01.wso2.domain',
  #                  :wso2_user => 'deslive',
  #                  :wso2_group => 'des',
  #                  :mgt_host => 'desesb01m-mgmt',
  #                  :offset => '12',
  #                  :hazelcast_port => '4020',
  #                  :cluster_members => { 'desesb01m' => '4020' },
  #                  :apache_user => 'apache',
  #                  :apache_group => 'apache',
  #                  :apache_port => '10800',
  #                  :svn_username => 'svn',
  #                  :svn_password => 'svnpass'
  #               } }
  #  it do
  #    expect {
  #      should compile
  #    }.to raise_error(Puppet::Error, /'tier' not defined or not in /)
  #  end
  #end 

  #context 'test failure message when subdomain not supplied' do
  #  let(:title) { 'wso2esb instances install' }
  #  let(:params) { {:ensure => 'present',
  #                  :wso2_version => '4.8.1',
  #                  :des_package_name => 'desesb-data-4.8.1_1.0.0',
  #                  :des_root => '/opt/app/des',
  #                  :tier => 'data',
  #                  #:subdomain => 'mgt',
  #                  :server_name => 'desesb01m',
  #                  :wso2_domain => 'desesb01.wso2.domain',
  #                  :wso2_user => 'deslive',
  #                  :wso2_group => 'des',
  #                  :mgt_host => 'desesb01m-mgmt',
  #                  :offset => '12',
  #                  :hazelcast_port => '4020',
  #                  :cluster_members => { 'desesb01m' => '4020' },
  #                  :apache_user => 'apache',
  #                  :apache_group => 'apache',
  #                  :apache_port => '10800',
  #                  :svn_username => 'svn',
  #                  :svn_password => 'svnpass'
  #               } }
  #  it do
  #    expect {
  #      should compile
  #    }.to raise_error(Puppet::Error, /'subdomain' not defined or not in /)
  #  end
  #end 
  
  #context 'test failure message when subdomain not correct value' do
  #  let(:title) { 'wso2esb instances install' }
  #  let(:params) { {:ensure => 'present',
  #                  :wso2_version => '4.8.1',
  #                  :des_package_name => 'desesb-data-4.8.1_1.0.0',
  #                  :des_root => '/opt/app/des',
  #                  :tier => 'data',
  #                  :subdomain => 'wibble',
  #                  :server_name => 'desesb01m',
  #                  :wso2_domain => 'desesb01.wso2.domain',
  #                  :wso2_user => 'deslive',
  #                  :wso2_group => 'des',
  #                  :mgt_host => 'desesb01m-mgmt',
  #                  :offset => '12',
  #                  :hazelcast_port => '4020',
  #                  :cluster_members => { 'desesb01m' => '4020' },
  #                  :apache_user => 'apache',
  #                  :apache_group => 'apache',
  #                  :apache_port => '10800',
  #                  :svn_username => 'svn',
  #                  :svn_password => 'svnpass'
  #               } }
  #  it do
  #    expect {
  #      should compile
  #    }.to raise_error(Puppet::Error, /'subdomain' not defined or not in /)
  #  end
  #end   

  #context 'test failure message when server_name not supplied' do
  #  let(:title) { 'wso2esb instances install' }
  #  let(:params) { {:ensure => 'present',
  #                  :wso2_version => '4.8.1',
  #                  :des_package_name => 'desesb-data-4.8.1_1.0.0',
  #                  :des_root => '/opt/app/des',
  #                  :tier => 'data',
  #                  :subdomain => 'mgt',
  #                  #:server_name => 'desesb01m',
  #                  :wso2_domain => 'desesb01.wso2.domain',
  #                  :wso2_user => 'deslive',
  #                  :wso2_group => 'des',
  #                  :mgt_host => 'desesb01m-mgmt',
  #                  :offset => '12',
  #                  :hazelcast_port => '4020',
  #                  :cluster_members => { 'desesb01m' => '4020' },
  #                  :apache_user => 'apache',
  #                  :apache_group => 'apache',
  #                  :apache_port => '10800',
  #                  :svn_username => 'svn',
  #                  :svn_password => 'svnpass'
  #               } }
  #  it do
  #    expect {
  #      should compile
  #    }.to raise_error(Puppet::Error, /'server_name' must be defined/)
  #  end
  #end 

  #
  # Test package installation and SVN setup
  #
  
  context 'install instance with tier => data and subdomain => mgt, all params supplied' do
    let(:title) { 'wso2esb instances install, test svn and package install' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-data-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'data',
                    :subdomain => 'mgt',
                    :server_name => 'desesb01m',
                    :wso2_domain => 'desesb01.wso2.domain',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :mgt_host => 'desesb01m-mgmt',
                    :offset => '16',
                    :hazelcast_port => '4020',
                    :cluster_members => { 'desesb01m' => '4020' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                 } }
    #
    # Package install stuff
    #
    it do 
      should contain_file('/opt/app/des/desesb01m').with(
        :ensure  => 'directory'
       )
      should contain_package('desesb-data-4.8.1_1.0.0').with(
        :ensure  => 'present',
        :source  => 'http://repomirror/Capgemini/Packages/desesb-data-4.8.1_1.0.0.rpm',
        :provider  => 'rpm',
        #:install_options => '[ { --prefix => /opt/app/des/desesb01m} ]',
        :require => 'File[/opt/app/des/desesb01m]'
      )
      #should contain_file('/opt/app/des/desesb01m/repository/carbonapps/work').with(
      #  :ensure  => 'directory'
      # )
      should contain_file('/opt/app/des/desesb01m/custom_resources').with(
        :ensure  => 'directory',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755'
       )
      should contain_exec('set-ownership-/opt/app/des/desesb01m').with(
        :command   => 'chown -R deslive:des /opt/app/des/desesb01m && chmod -R 755 /opt/app/des/desesb01m',
        :logoutput  => 'on_failure',
        :timeout   => 0,
        :require   => '[Package[desesb-data-4.8.1_1.0.0]{:name=>"desesb-data-4.8.1_1.0.0"}, File[/opt/app/des/desesb01m/custom_resources/properties]{:path=>"/opt/app/des/desesb01m/custom_resources/properties"}]'
      )
      should contain_file('/var/log/des/desesb01m').with(
        :ensure  => 'directory'
       )
      should contain_file('/opt/app/des/desesb01m/repository/logs').with(
        :ensure  => 'link',
        :target  => '/var/log/des/desesb01m',
        :require => 'File[/opt/app/des/desesb01m]'
       )
    end
  end

  context 'install instance with tier => data and subdomain => worker, all params supplied' do
    let(:title) { 'wso2esb instances install, test svn and package install' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-data-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'data',
                    :subdomain => 'worker',
                    :server_name => 'desesb01a',
                    :wso2_domain => 'desesb01.wso2.domain',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :mgt_host => 'localhost',
                    :offset => '6',
                    :hazelcast_port => '4022',
                    :cluster_members => { 'desesb01m' => '4022' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                 } }
    #
    # Package install stuff
    #
    it do 
      should contain_file('/opt/app/des/desesb01a').with(
        :ensure  => 'directory'
       )
      should contain_package('desesb-data-4.8.1_1.0.0').with(
        :ensure  => 'present',
        :source  => 'http://repomirror/Capgemini/Packages/desesb-data-4.8.1_1.0.0.rpm',
        :provider  => 'rpm',
        #:install_options => '[ { --prefix => /opt/app/des/desesb01a} ]',
        :require => 'File[/opt/app/des/desesb01a]'
      )
      #should contain_file('/opt/app/des/desesb01m/repository/carbonapps/work').with(
      #  :ensure  => 'directory'
      # )
      should contain_file('/opt/app/des/desesb01a/custom_resources').with(
        :ensure  => 'directory',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755'
       )
      should contain_exec('set-ownership-/opt/app/des/desesb01a').with(
        :command   => 'chown -R deslive:des /opt/app/des/desesb01a && chmod -R 755 /opt/app/des/desesb01a',
        :logoutput  => 'on_failure',
        :timeout   => 0,
        :require   => '[Package[desesb-data-4.8.1_1.0.0]{:name=>"desesb-data-4.8.1_1.0.0"}, File[/opt/app/des/desesb01a/custom_resources/properties]{:path=>"/opt/app/des/desesb01a/custom_resources/properties"}]'
      )
      should contain_file('/var/log/des/desesb01a').with(
        :ensure  => 'directory'
       )
      should contain_file('/opt/app/des/desesb01a/repository/logs').with(
        :ensure  => 'link',
        :target  => '/var/log/des/desesb01a',
        :require => 'File[/opt/app/des/desesb01a]'
       )
    end
  end

  #
  # Test platform config
  #  
  
  context 'configure esb instance with tier => data and subdomain => mgt, all params supplied (override defaults), no rabbitmq' do
    let(:title) { 'configure esb instance with tier => data and subdomain => mgt, all params supplied (override defaults), no rabbitmq' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-data-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'data',
                    :subdomain => 'mgt',
                    :server_name => 'desesb01m',
                    :wso2_domain => 'desesb01.wso2.domain',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :mgt_host => 'desesb01m-mgmt',
                    :offset => '16',
                    :hazelcast_port => '4020',
                    :cluster_members => { 'desesb01a' => '4021', 'desesb01b' => '4022' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb01m').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-data-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/desesb01m\"/)
       should contain_file('/etc/rc.d/init.d/desesb01m').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb01m').with(
        :ensure    => 'running',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb01m]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<MgtHostName>desesb01m-mgmt<\/MgtHostName>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<Offset>16<\/Offset>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').without_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').without_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').without_content(/<Role>GovernanceRegistry<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<AutoCommit>true<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb01m:10080\/svn\/desesb01<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb01m<\/parameter>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb01.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').without_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').without_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').without_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').without_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender\/>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb01m<\/parameter>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4020<\/parameter>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="mgt"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb01a<\/hostName>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<port>4021<\/port>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb01b<\/hostName>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<port>4022<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2UM_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2UM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2GREG_DB<\/name>\n\s*<description>The datasource used for Governance Registry database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2GREG_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>The datasource used for API Manager database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="wso2registry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml'
      ).without_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/nodes<\/targetPath>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml'
      ).without_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2_SHARED_DB<\/Property>/)
    end 
  end

  context 'configure esb instance with tier => data and subdomain => mgt, all params supplied (override defaults), configure rabbitmq with defaults' do
    let(:title) { 'configure esb instance with tier => data and subdomain => mgt, all params supplied (override defaults), configure rabbitmq with defaults' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-data-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'data',
                    :subdomain => 'mgt',
                    :server_name => 'desesb01m',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_password => 'ABCDE12345',
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb01m').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-data-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/desesb01m\"/)
       should contain_file('/etc/rc.d/init.d/desesb01m').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb01m').with(
        :ensure    => 'running',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb01m]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<MgtHostName>desesb01m-mgmt<\/MgtHostName>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<Offset>16<\/Offset>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').without_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').without_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').without_content(/<Role>GovernanceRegistry<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<AutoCommit>true<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb01m:10080\/svn\/desesb01<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb01m<\/parameter>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb01.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').without_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').without_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').without_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').without_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender\/>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb01m<\/parameter>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4060<\/parameter>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="mgt"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb01a<\/hostName>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<port>4061<\/port>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb01b<\/hostName>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<port>4062<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2UM_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2UM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2GREG_DB<\/name>\n\s*<description>The datasource used for Governance Registry database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2GREG_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>The datasource used for API Manager database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="wso2registry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml'
      ).without_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/nodes<\/targetPath>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml'
      ).without_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2_SHARED_DB<\/Property>/)
    end 
  end

  context 'configure esb instance with tier => data and subdomain => mgt, all params supplied (override defaults), configure rabbitmq with defaults, no deployment sync' do
    let(:title) { 'configure esb instance with tier => data and subdomain => mgt, all params supplied (override defaults), configure rabbitmq with defaults, no deployment sync' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-data-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'data',
                    :subdomain => 'mgt',
                    :server_name => 'desesb01m',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :deployment_synch_enabled => 'false',
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_password => 'ABCDE12345',
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb01m').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-data-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/desesb01m\"/)
       should contain_file('/etc/rc.d/init.d/desesb01m').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb01m').with(
        :ensure    => 'running',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb01m]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<MgtHostName>desesb01m-mgmt<\/MgtHostName>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<Offset>16<\/Offset>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').without_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').without_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').without_content(/<Role>GovernanceRegistry<\/Role>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>false<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<AutoCommit>false<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/svnrepo.example.com\/repos\/<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<SvnUser>username<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/carbon.xml').with_content(/<SvnPassword>password<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb01m<\/parameter>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb01.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').without_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').without_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').without_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').without_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender\/>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb01m<\/parameter>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4060<\/parameter>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="mgt"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="false">/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb01a<\/hostName>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<port>4061<\/port>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb01b<\/hostName>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<port>4062<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2UM_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2UM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2GREG_DB<\/name>\n\s*<description>The datasource used for Governance Registry database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2GREG_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>The datasource used for API Manager database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="wso2registry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml'
      ).without_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/nodes<\/targetPath>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml'
      ).without_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/desesb01m/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/desesb01m/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2_SHARED_DB<\/Property>/)
    end 
  end
  
  context 'configure esb instance with tier => data and subdomain => worker, all params supplied (override defaults), no rabbitmq' do
    let(:title) { 'configure esb instance with tier => data and subdomain => worker, all params supplied (override defaults), no rabbitmq' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-data-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'data',
                    :subdomain => 'worker',
                    :server_name => 'desesb01a',
                    :wso2_domain => 'desesb01.wso2.domain',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :mgt_host => 'localhost',
                    :offset => '16',
                    :hazelcast_port => '4050',
                    :cluster_members => { 'desesb01m' => '4020' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb01a').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-data-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/desesb01a\"/)
       should contain_file('/etc/rc.d/init.d/desesb01a').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb01a').with(
        :ensure    => 'running',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb01a]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<MgtHostName>localhost<\/MgtHostName>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<Offset>16<\/Offset>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').without_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').without_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').without_content(/<Role>GovernanceRegistry<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<AutoCommit>false<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb01m:10080\/svn\/desesb01<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb01a<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb01.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').without_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb01a<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4050<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="worker"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb01m<\/hostName>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<port>4020<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2UM_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2UM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2GREG_DB<\/name>\n\s*<description>The datasource used for Governance Registry database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2GREG_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>The datasource used for API Manager database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml'
      ).without_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/nodes<\/targetPath>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml'
      ).without_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-worker.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2_SHARED_DB<\/Property>/)
    end 
  end

  context 'configure esb instance with tier => data and subdomain => worker, all params supplied (override defaults), configure rabbitmq with defaults' do
    let(:title) { 'configure esb instance with tier => data and subdomain => worker, all params supplied (override defaults), configure rabbitmq with defaults' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-data-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'data',
                    :subdomain => 'worker',
                    :server_name => 'desesb01a',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_password => 'ABCDE12345',
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb01a').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-data-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/desesb01a\"/)
       should contain_file('/etc/rc.d/init.d/desesb01a').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb01a').with(
        :ensure    => 'running',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb01a]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<MgtHostName>localhost<\/MgtHostName>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<Offset>6<\/Offset>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').without_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').without_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').without_content(/<Role>GovernanceRegistry<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<AutoCommit>false<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb01m:10080\/svn\/desesb01<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb01a<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb01.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.host.name" locked="false">desbkr01-vip<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.port" locked="false">5672<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.user.name" locked="false">wso2_rabbit_data<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.password" locked="false">ABCDE12345<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb01a<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4061<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="worker"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb01m<\/hostName>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<port>4060<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2UM_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2UM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2GREG_DB<\/name>\n\s*<description>The datasource used for Governance Registry database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2GREG_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>The datasource used for API Manager database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml'
      ).without_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/nodes<\/targetPath>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml'
      ).without_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-worker.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2_SHARED_DB<\/Property>/)
    end 
  end

  context 'configure esb instance with tier => data and subdomain => worker, all params supplied (override defaults), configure rabbitmq override defaults' do
    let(:title) { 'configure esb instance with tier => data and subdomain => worker, all params supplied (override defaults), configure rabbitmq override defaults' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-data-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'data',
                    :subdomain => 'worker',
                    :server_name => 'desesb01a',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_host => 'rabbitmq-01',
                    :rabbitmq_port => '9999',
                    :rabbitmq_username => 'fastrabbit',
                    :rabbitmq_password => 'ABCDE12345',
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb01a').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-data-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/desesb01a\"/)
       should contain_file('/etc/rc.d/init.d/desesb01a').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb01a').with(
        :ensure    => 'running',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb01a]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<MgtHostName>localhost<\/MgtHostName>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<Offset>6<\/Offset>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').without_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').without_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').without_content(/<Role>GovernanceRegistry<\/Role>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<AutoCommit>false<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb01m:10080\/svn\/desesb01<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb01a<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb01.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.host.name" locked="false">rabbitmq-01<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.port" locked="false">9999<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.user.name" locked="false">fastrabbit<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.password" locked="false">ABCDE12345<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb01a<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4061<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="worker"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb01m<\/hostName>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<port>4060<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2UM_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2UM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2GREG_DB<\/name>\n\s*<description>The datasource used for Governance Registry database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2GREG_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml'
      ).without_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>The datasource used for API Manager database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml'
      ).without_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/nodes<\/targetPath>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml'
      ).without_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-worker.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2_SHARED_DB<\/Property>/)
    end 
  end
  
  context 'configure esb instance with tier => corp and subdomain => mgt, all params supplied (override defaults), no rabbitmq' do
    let(:title) { 'configure esb instance with tier => corp and subdomain => mgt, all params supplied (override defaults), no rabbitmq' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-corp-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'corp',
                    :subdomain => 'mgt',
                    :server_name => 'desesb02m',
                    :wso2_domain => 'desesb02.wso2.domain',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :mgt_host => 'desesb02m-mgmt',
                    :offset => '26',
                    :hazelcast_port => '4080',
                    :cluster_members => { 'desesb02a' => '4081', 'desesb02b' => '4082' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb02m').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-corp-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/desesb02m\"/)
       should contain_file('/etc/rc.d/init.d/desesb02m').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb02m').with(
        :ensure    => 'running',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb02m]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<MgtHostName>desesb02m-mgmt<\/MgtHostName>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<Offset>26<\/Offset>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').without_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').without_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<Role>GovernanceRegistry<\/Role>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<AutoCommit>true<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb02m:10080\/svn\/desesb02<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb02m<\/parameter>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb02.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').without_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').without_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').without_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').without_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender\/>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb02m<\/parameter>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4080<\/parameter>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="mgt"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb02a<\/hostName>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<port>4081<\/port>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb02b<\/hostName>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<port>4082<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb02m/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).without_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2UM_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2UM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2GREG_DB<\/name>\n\s*<description>The datasource used for Governance Registry database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2GREG_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>The datasource used for API Manager database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb02m/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/registry.xml'
      ).with_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2GREG_DB<\/dataSource>\n\s*<\/dbConfig>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/registry.xml'
      ).with_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/nodes<\/targetPath>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/registry.xml'
      ).with_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/registry.xml'
      ).with_content(/<remoteInstance url="https:\/\/desreg01:9447\/registry">\n\s*<id>instanceid<\/id>\n\s*<dbConfig>sharedregistry<\/dbConfig>\n\s*<readOnly>false<\/readOnly>\n\s*<enableCache>true<\/enableCache>\n\s*<registryRoot>\/<\/registryRoot>\n\s*<\/remoteInstance>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/desesb02m/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2UM_DB<\/Property>/)
    end 
  end

  context 'configure esb instance with tier => corp and subdomain => mgt, all params supplied (override defaults), configure rabbitmq with defaults' do
    let(:title) { 'configure esb instance with tier => corp and subdomain => mgt, all params supplied (override defaults), configure rabbitmq with defaults' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-corp-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'corp',
                    :subdomain => 'mgt',
                    :server_name => 'desesb02m',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_password => 'ABCDE12345',
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb02m').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-corp-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/desesb02m\"/)
       should contain_file('/etc/rc.d/init.d/desesb02m').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb02m').with(
        :ensure    => 'running',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb02m]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<MgtHostName>desesb02m-mgmt<\/MgtHostName>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<Offset>12<\/Offset>/)
       should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').without_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').without_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<AutoCommit>true<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb02m:10080\/svn\/desesb02<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb02m<\/parameter>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb02.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').without_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').without_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').without_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').without_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender\/>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb02m<\/parameter>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4020<\/parameter>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="mgt"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb02a<\/hostName>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<port>4021<\/port>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb02b<\/hostName>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<port>4022<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb02m/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).without_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2UM_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2UM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2GREG_DB<\/name>\n\s*<description>The datasource used for Governance Registry database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2GREG_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>The datasource used for API Manager database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb02m/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/registry.xml'
      ).with_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2GREG_DB<\/dataSource>\n\s*<\/dbConfig>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/registry.xml'
      ).with_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/nodes<\/targetPath>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/registry.xml'
      ).with_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/registry.xml'
      ).with_content(/<remoteInstance url="https:\/\/desreg01:9447\/registry">\n\s*<id>instanceid<\/id>\n\s*<dbConfig>sharedregistry<\/dbConfig>\n\s*<readOnly>false<\/readOnly>\n\s*<enableCache>true<\/enableCache>\n\s*<registryRoot>\/<\/registryRoot>\n\s*<\/remoteInstance>/)
      should contain_file('/opt/app/des/desesb02m/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/desesb02m/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2UM_DB<\/Property>/)
    end
  end
  
 context 'configure esb instance with tier => corp and subdomain => worker, all params supplied (override defaults), no rabbitmq' do
    let(:title) { 'configure esb instance with tier => corp and subdomain => worker, all params supplied (override defaults), no rabbitmq' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-corp-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'corp',
                    :subdomain => 'worker',
                    :server_name => 'desesb02a',
                    :wso2_domain => 'desesb02.wso2.domain',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :mgt_host => 'localhost',
                    :offset => '26',
                    :hazelcast_port => '4081',
                    :cluster_members => { 'desesb02m' => '4080' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb02a').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-corp-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/desesb02a\"/)
       should contain_file('/etc/rc.d/init.d/desesb02a').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb02a').with(
        :ensure    => 'running',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb02a]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<MgtHostName>localhost<\/MgtHostName>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Offset>26<\/Offset>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').without_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').without_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<AutoCommit>false<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb02m:10080\/svn\/desesb02<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb02a<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb02.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').without_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb02a<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4081<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="worker"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb02m<\/hostName>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<port>4080<\/port>/)

    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).without_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2UM_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2UM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2GREG_DB<\/name>\n\s*<description>The datasource used for Governance Registry database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2GREG_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>The datasource used for API Manager database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2GREG_DB<\/dataSource>\n\s*<\/dbConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/nodes<\/targetPath>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<remoteInstance url="https:\/\/desreg01:9447\/registry">\n\s*<id>instanceid<\/id>\n\s*<dbConfig>sharedregistry<\/dbConfig>\n\s*<readOnly>false<\/readOnly>\n\s*<enableCache>true<\/enableCache>\n\s*<registryRoot>\/<\/registryRoot>\n\s*<\/remoteInstance>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2UM_DB<\/Property>/)
    end 
  end

  context 'configure esb instance with tier => corp and subdomain => worker, all params supplied (override defaults), configure rabbitmq with defaults' do
    let(:title) { 'configure esb instance with tier => corp and subdomain => worker, all params supplied (override defaults), configure rabbitmq with defaults' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-corp-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'corp',
                    :subdomain => 'worker',
                    :server_name => 'desesb02a',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_password => 'ABCDE12345',
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb02a').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-corp-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/desesb02a\"/)
       should contain_file('/etc/rc.d/init.d/desesb02a').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb02a').with(
        :ensure    => 'running',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb02a]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<MgtHostName>localhost<\/MgtHostName>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Offset>2<\/Offset>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').without_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').without_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<AutoCommit>false<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb02m:10080\/svn\/desesb02<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb02a<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb02.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.host.name" locked="false">desbkr01-vip<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.port" locked="false">6672<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.user.name" locked="false">wso2_rabbit_corp<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.password" locked="false">ABCDE12345<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb02a<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4021<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="worker"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb02m<\/hostName>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<port>4020<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).without_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2UM_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2UM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2GREG_DB<\/name>\n\s*<description>The datasource used for Governance Registry database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2GREG_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>The datasource used for API Manager database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2GREG_DB<\/dataSource>\n\s*<\/dbConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/nodes<\/targetPath>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<remoteInstance url="https:\/\/desreg01:9447\/registry">\n\s*<id>instanceid<\/id>\n\s*<dbConfig>sharedregistry<\/dbConfig>\n\s*<readOnly>false<\/readOnly>\n\s*<enableCache>true<\/enableCache>\n\s*<registryRoot>\/<\/registryRoot>\n\s*<\/remoteInstance>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2UM_DB<\/Property>/)
    end
  end

  context 'configure esb instance with tier => corp and subdomain => worker, all params supplied (override defaults), configure rabbitmq with defaults' do
    let(:title) { 'configure esb instance with tier => corp and subdomain => worker, all params supplied (override defaults), configure rabbitmq with defaults' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-corp-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'corp',
                    :subdomain => 'worker',
                    :server_name => 'desesb02a',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_host => 'rabbitmq-01',
                    :rabbitmq_port => '9999',
                    :rabbitmq_username => 'fastrabbit',
                    :rabbitmq_password => 'ABCDE12345',
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb02a').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-corp-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/desesb02a\"/)
       should contain_file('/etc/rc.d/init.d/desesb02a').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb02a').with(
        :ensure    => 'running',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb02a]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<MgtHostName>localhost<\/MgtHostName>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Offset>2<\/Offset>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').without_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').without_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<AutoCommit>false<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb02m:10080\/svn\/desesb02<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb02a<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb02.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.host.name" locked="false">rabbitmq-01<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.port" locked="false">9999<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.user.name" locked="false">fastrabbit<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.password" locked="false">ABCDE12345<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb02a<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4021<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="worker"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb02m<\/hostName>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<port>4020<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).without_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2UM_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2UM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2GREG_DB<\/name>\n\s*<description>The datasource used for Governance Registry database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2GREG_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>The datasource used for API Manager database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2GREG_DB<\/dataSource>\n\s*<\/dbConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/nodes<\/targetPath>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<remoteInstance url="https:\/\/desreg01:9447\/registry">\n\s*<id>instanceid<\/id>\n\s*<dbConfig>sharedregistry<\/dbConfig>\n\s*<readOnly>false<\/readOnly>\n\s*<enableCache>true<\/enableCache>\n\s*<registryRoot>\/<\/registryRoot>\n\s*<\/remoteInstance>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2UM_DB<\/Property>/)
    end
  end

  context 'configure esb instance with tier => corp and subdomain => worker, all params supplied (override defaults), configure rabbitmq with defaults, no deployment synch' do
    let(:title) { 'configure esb instance with tier => corp and subdomain => worker, all params supplied (override defaults), configure rabbitmq with defaults, no deployment synch' }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-corp-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'corp',
                    :subdomain => 'worker',
                    :server_name => 'desesb02a',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :deployment_synch_enabled => 'false',
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_host => 'rabbitmq-01',
                    :rabbitmq_port => '9999',
                    :rabbitmq_username => 'fastrabbit',
                    :rabbitmq_password => 'ABCDE12345',
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb02a').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-corp-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/desesb02a\"/)
       should contain_file('/etc/rc.d/init.d/desesb02a').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb02a').with(
        :ensure    => 'running',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb02a]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<MgtHostName>localhost<\/MgtHostName>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Offset>2<\/Offset>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').without_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').without_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>false<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<AutoCommit>false<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/svnrepo.example.com\/repos\/<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<SvnUser>username<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<SvnPassword>password<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb02a<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb02.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.host.name" locked="false">rabbitmq-01<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.port" locked="false">9999<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.user.name" locked="false">fastrabbit<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="rabbitmq.server.password" locked="false">ABCDE12345<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb02a<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4021<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="worker"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="false">/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb02m<\/hostName>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<port>4020<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).without_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2UM_DB<\/name>\n\s*<description>The datasource used for User Management database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2UM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2GREG_DB<\/name>\n\s*<description>The datasource used for Governance Registry database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2GREG_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>The datasource used for API Manager database<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2GREG_DB<\/dataSource>\n\s*<\/dbConfig>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/nodes<\/targetPath>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).with_content(/<remoteInstance url="https:\/\/desreg01:9447\/registry">\n\s*<id>instanceid<\/id>\n\s*<dbConfig>sharedregistry<\/dbConfig>\n\s*<readOnly>false<\/readOnly>\n\s*<enableCache>true<\/enableCache>\n\s*<registryRoot>\/<\/registryRoot>\n\s*<\/remoteInstance>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/registry.xml'
      ).without_content(/<dbConfig name="sharedregistry">\n\s*<dataSource>jdbc\/WSO2_SHARED_DB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2UM_DB<\/Property>/)
    end
  end
    
  #
  # Test package removal and SVN removal
  #
  
  context 'remove instance with tier => data and subdomain => mgt, all params supplied' do
    let(:title) { 'wso2esb instances remove, test svn and package removel' }
    let(:params) { {:ensure => 'absent',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-data-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'data',
                    :subdomain => 'mgt',
                    :server_name => 'desesb01m',
                    :wso2_domain => 'desesb01.wso2.domain',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :mgt_host => 'desesb01m-mgmt',
                    :offset => '16',
                    :hazelcast_port => '4020',
                    :cluster_members => { 'desesb01m' => '4020' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                 } }

    it do 
      should contain_service('desesb01m').with(
        :ensure  => 'stopped',
        :enable  => 'false'
      )
    end

    it do 
      should contain_file('/etc/rc.d/init.d/desesb01m').with(
        :ensure  => 'absent'
      )
    end

    it do 
      should contain_package('desesb-data-4.8.1_1.0.0').with(
        :ensure  => 'absent',
        :provider  => 'rpm',
      )
    end 
  end
end
