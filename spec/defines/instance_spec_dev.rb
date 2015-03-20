require 'spec_helper'
describe 'wso2esb::instance', :type => :define do

  context 'configure esb instance with tier => data and subdomain => worker, configure rabbitmq with defaults, citb' do
    let(:title) { 'configure esb instance with tier => data and subdomain => worker, configure rabbitmq with defaults, citb' }
    let(:facts) { {:env => 'des-dev'} }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-data-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'data',
                    :subdomain => 'worker',
                    :server_name => 'desesb01a',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :offset => '6',
                    :hazelcast_port => '4061',
                    :cluster_members => { 'localhost' => '4061' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_password => 'ABCDE12345',
                    :ensure_service => 'stopped',
					:deployment_synch_enabled => 'false'
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
        :ensure    => 'stopped',
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
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>false<\/Enabled>/m)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<AutoCommit>false<\/AutoCommit>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/svnrepo.example.com\/repos\/<\/SvnUrl>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<SvnUser>username<\/SvnUser>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/carbon.xml').with_content(/<SvnPassword>password<\/SvnPassword>/)
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
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb01a<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4061<\/parameter>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="worker"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="false">/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<hostName>localhost<\/hostName>/)
      should contain_file('/opt/app/des/desesb01a/repository/conf/axis2/axis2.xml').with_content(/<port>4061<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<datasource>\n\s*<name>WSO2_CARBON_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2CarbonDB<\/name>\n\s*<\/jndiConfig>/)
	  should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml'
	  ).without_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2CarbonDB<\/name>\n\s*<\/jndiConfig>/)
	  should contain_file('/opt/app/des/desesb01a/repository/conf/datasources/master-datasources.xml'
	  ).without_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<dbConfig name=\"wso2registry\">\n*\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/desesb01a/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01a]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2CarbonDB<\/Property>/)
    end 
  end
  
  context 'configure esb instance with tier => corp and subdomain => worker, configure rabbitmq with defaults, citb' do
    let(:title) { 'configure esb instance with tier => corp and subdomain => worker, configure rabbitmq with defaults, citb' }
    let(:facts) { {:env => 'des-dev'} }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-corp-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'corp',
                    :subdomain => 'worker',
                    :server_name => 'desesb02a',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :offset => '2',
                    :hazelcast_port => '4021',
                    :cluster_members => { 'desesb02a' => '4021' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_password => 'ABCDE12345',
                    :ensure_service => 'stopped',
					:deployment_synch_enabled => 'false'
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
        :ensure    => 'stopped',
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
      should contain_file('/opt/app/des/desesb02a/repository/conf/carbon.xml').with_content(/<Role>GovernanceRegistry<\/Role>/)
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
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb02a<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4021<\/parameter>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="worker"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="false">/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb02a<\/hostName>/)
      should contain_file('/opt/app/des/desesb02a/repository/conf/axis2/axis2.xml').with_content(/<port>4021<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<datasource>\n\s*<name>WSO2_CARBON_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2CarbonDB<\/name>\n\s*<\/jndiConfig>/)
	  should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
	  ).without_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2CarbonDB<\/name>\n\s*<\/jndiConfig>/)
	  should contain_file('/opt/app/des/desesb02a/repository/conf/datasources/master-datasources.xml'
	  ).without_content(/<datasource>\n\s*<name>WSO2_SHARED_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2_SHARED_DB<\/name>\n\s*<\/jndiConfig>/)
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
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/desesb02a/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02a]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/WSO2CarbonDB<\/Property>/)
    end 
  end
end
