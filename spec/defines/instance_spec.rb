require 'spec_helper'
describe 'wso2esb::instance', :type => :define do

  context 'configure esb instance with tier => data and subdomain => mgt, configure rabbitmq with defaults, citb' do
    let(:title) { 'configure esb instance with tier => data and subdomain => mgt, configure rabbitmq with defaults, citb' }
    let(:facts) { {:env => 'citb'} }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-data-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'data',
                    :subdomain => 'mgt',
                    :server_name => 'desesb01m',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :offset => '6',
                    :hazelcast_port => '4021',
                    :cluster_members => { 'desesb01b' => '4022' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_password => 'ABCDE12345',
                    :ensure_service => 'stopped' 
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb01m').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-data-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/citb\/desesb01m\"/)
       should contain_file('/etc/rc.d/init.d/desesb01m').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb01m').with(
        :ensure    => 'stopped',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb01m]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<MgtHostName>desesb01m-mgmt<\/MgtHostName>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').with_content(/<Offset>6<\/Offset>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').with_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').with_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').without_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').without_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').without_content(/<Role>GovernanceRegistry<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').with_content(/<AutoCommit>true<\/AutoCommit>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb01m:10080\/svn\/desesb01<\/SvnUrl>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb01m<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb01.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb01m<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4021<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="mgt"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/citb/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb01b<\/hostName>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/axis2/axis2.xml').with_content(/<port>4022<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_APM02_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_APM02_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desapm02_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_REG01_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_REG01_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desreg01_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_ESB01_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_ESB01_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desesb01_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_ESB02_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_ESB02_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desesb02_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_DSS01_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_DSS01_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desdss01_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_USERS_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_USERS_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desusers_citb<\/url>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<dbConfig name=\"sharedregistry\">\n*\s*<dataSource>jdbc\/CITB_REG01_DB<\/dataSource>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/registry.xml').with_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/config<\/targetPath>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/registry.xml').with_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/registry.xml').with_content(/<dbConfig name="wso2registry">\n\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/citb/desesb01m/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01m]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/CITB_USERS_DB<\/Property>/)
    end 
  end

  context 'configure esb instance with tier => data and subdomain => worker, configure rabbitmq with defaults, citb' do
    let(:title) { 'configure esb instance with tier => data and subdomain => worker, configure rabbitmq with defaults, citb' }
    let(:facts) { {:env => 'citb'} }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-data-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'data',
                    :subdomain => 'worker',
                    :server_name => 'desesb01b',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :offset => '6',
                    :hazelcast_port => '4022',
                    :cluster_members => { 'desesb01m' => '4021' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_password => 'ABCDE12345',
                    :ensure_service => 'stopped' 
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb01b').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-data-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/citb\/desesb01b\"/)
       should contain_file('/etc/rc.d/init.d/desesb01b').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb01b').with(
        :ensure    => 'stopped',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb01b]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01b]'
      ).with_content(/<MgtHostName>localhost<\/MgtHostName>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').with_content(/<Offset>6<\/Offset>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').with_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').with_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').without_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').without_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').without_content(/<Role>GovernanceRegistry<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').with_content(/<AutoCommit>false<\/AutoCommit>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb01m:10080\/svn\/desesb01<\/SvnUrl>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01b]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb01b<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb01.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb01b<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4022<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="worker"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/citb/desesb01b/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb01m<\/hostName>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/axis2/axis2.xml').with_content(/<port>4021<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01b]'
      ).with_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_APM02_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_APM02_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desapm02_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_REG01_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_REG01_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desreg01_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_ESB01_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_ESB01_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desesb01_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_ESB02_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_ESB02_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desesb02_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_DSS01_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_DSS01_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desdss01_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_USERS_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_USERS_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desusers_citb<\/url>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01b]'
      ).with_content(/<dbConfig name=\"sharedregistry\">\n*\s*<dataSource>jdbc\/CITB_REG01_DB<\/dataSource>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/registry.xml').with_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/config<\/targetPath>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/registry.xml').with_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb01\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/registry.xml').with_content(/<dbConfig name="wso2registry">\n\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/citb/desesb01b/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb01b]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/CITB_USERS_DB<\/Property>/)
    end 
  end
  
  context 'configure esb instance with tier => corp and subdomain => mgt, configure rabbitmq with defaults, citb' do
    let(:title) { 'configure esb instance with tier => corp and subdomain => mgt, configure rabbitmq with defaults, citb' }
    let(:facts) { {:env => 'citb'} }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-corp-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'corp',
                    :subdomain => 'mgt',
                    :server_name => 'desesb02m',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :offset => '6',
                    :hazelcast_port => '4061',
                    :cluster_members => { 'desesb02b' => '4062' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_password => 'ABCDE12345',
                    :ensure_service => 'stopped' 
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb02m').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-corp-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/citb\/desesb02m\"/)
       should contain_file('/etc/rc.d/init.d/desesb02m').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb02m').with(
        :ensure    => 'stopped',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb02m]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<MgtHostName>desesb02m-mgmt<\/MgtHostName>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').with_content(/<Offset>6<\/Offset>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').without_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').without_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').with_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').with_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').with_content(/<Role>GovernanceRegistry<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').with_content(/<AutoCommit>true<\/AutoCommit>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb02m:10080\/svn\/desesb02<\/SvnUrl>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb02m<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb02.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb02m<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4061<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="mgt"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/citb/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb02b<\/hostName>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/axis2/axis2.xml').with_content(/<port>4062<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_APM02_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_APM02_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desapm02_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_REG01_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_REG01_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desreg01_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_ESB01_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_ESB01_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desesb02_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_ESB02_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_ESB02_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desesb02_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_DSS01_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_DSS01_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desdss01_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_USERS_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_USERS_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desusers_citb<\/url>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<dbConfig name=\"sharedregistry\">\n*\s*<dataSource>jdbc\/CITB_REG01_DB<\/dataSource>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/registry.xml').with_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/config<\/targetPath>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/registry.xml').with_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/registry.xml').with_content(/<dbConfig name="wso2registry">\n\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/citb/desesb02m/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02m]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/CITB_USERS_DB<\/Property>/)
    end 
  end

  context 'configure esb instance with tier => corp and subdomain => worker, configure rabbitmq with defaults, citb' do
    let(:title) { 'configure esb instance with tier => corp and subdomain => worker, configure rabbitmq with defaults, citb' }
    let(:facts) { {:env => 'citb'} }
    let(:params) { {:ensure => 'present',
                    :wso2_version => '4.8.1',
                    :des_package_name => 'desesb-corp-4.8.1_1.0.0',
                    :des_root => '/opt/app/des',
                    :tier => 'corp',
                    :subdomain => 'worker',
                    :server_name => 'desesb02b',
                    :wso2_user => 'deslive',
                    :wso2_group => 'des',
                    :offset => '6',
                    :hazelcast_port => '4062',
                    :cluster_members => { 'desesb02m' => '4061' },
                    :apache_user => 'apache',
                    :apache_group => 'apache',
                    :apache_port => '10080',
                    :svn_username => 'svn',
                    :svn_password => 'svn',
                    :rabbitmq_password => 'ABCDE12345',
                    :ensure_service => 'stopped' 
                 } }
    it do 
      should contain_file('/etc/rc.d/init.d/desesb02b').with(
        :ensure  => 'present',
        :mode     => '0755',
        :require  => 'Package[desesb-corp-4.8.1_1.0.0]'
       ).with_content(/CARBON_HOME=\"\/opt\/app\/des\/citb\/desesb02b\"/)
       should contain_file('/etc/rc.d/init.d/desesb02b').with_content(/USER=\"deslive\"/)
    end
    it do 
      should contain_service('desesb02b').with(
        :ensure    => 'stopped',
        :enable    => 'true', 
        :require  => 'File[/etc/rc.d/init.d/desesb02b]'
       )
    end  
    # carbon.xml
    it do
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02b]'
      ).with_content(/<MgtHostName>localhost<\/MgtHostName>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').with_content(/<Offset>6<\/Offset>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').with_content(/<Role>EnterpriseServiceBus<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').without_content(/<Role>GREG_DATA<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').without_content(/<Role>ESB_DATA<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').with_content(/<Role>GREG_CORP<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').with_content(/<Role>ESB_CORP<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').with_content(/<Role>GovernanceRegistry<\/Role>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').with_content(/\s*<DeploymentSynchronizer>\n\s*<Enabled>true<\/Enabled>/m)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').with_content(/<AutoCommit>false<\/AutoCommit>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').with_content(/<SvnUrl>http:\/\/desesb02m:10080\/svn\/desesb02<\/SvnUrl>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').with_content(/<SvnUser>svn<\/SvnUser>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/carbon.xml').with_content(/<SvnPassword>svn<\/SvnPassword>/)
    end
    # axis2.xml
    it do
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/axis2/axis2.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02b]'
      ).with_content(/<parameter name="SynapseConfig.ServerName" locked="false">desesb02b<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/axis2/axis2.xml').with_content(/<parameter name="domain">desesb02.wso2.domain<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportListener"\/>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/axis2/axis2.xml').with_content(/<transportReceiver name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQListener">/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="rabbitmq" class="uk.gov.hmrc.wso2.rabbitmq.RabbitMQSender"\/>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/axis2/axis2.xml').with_content(/<transportSender name="vfs" class="org.apache.synapse.transport.vfs.VFSTransportSender"\/>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberHost">desesb02b<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/axis2/axis2.xml').with_content(/<parameter name="localMemberPort">4062<\/parameter>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/axis2/axis2.xml').with_content(/<property name="subDomain" value="worker"\/>/)
      # members and clustering
	  should contain_file('/opt/app/des/citb/desesb02b/repository/conf/axis2/axis2.xml').with_content(/<clustering class="org.wso2.carbon.core.clustering.hazelcast.HazelcastClusteringAgent"\n\s*enable="true">/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/axis2/axis2.xml').with_content(/<hostName>desesb02m<\/hostName>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/axis2/axis2.xml').with_content(/<port>4061<\/port>/)
    end
    # master-datasources.xml
    it do
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02b]'
      ).with_content(/<datasource>\n\s*<name>WSO2AM_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/WSO2AM_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_APM02_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_APM02_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desapm02_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_REG01_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_REG01_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desreg01_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_ESB01_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_ESB01_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desesb02_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_ESB02_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_ESB02_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desesb02_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_DSS01_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_DSS01_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desdss01_citb<\/url>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<datasource>\n\s*<name>CITB_USERS_DB<\/name>\n\s*<description>.*<\/description>\n\s*<jndiConfig>\n\s*<name>jdbc\/CITB_USERS_DB<\/name>\n\s*<\/jndiConfig>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/datasources/master-datasources.xml'
      ).with_content(/<url>jdbc:mysql:\/\/wso2-des-db:3306\/desusers_citb<\/url>/)
    end
    # registry.xml
    it do
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/registry.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02b]'
      ).with_content(/<dbConfig name=\"sharedregistry\">\n*\s*<dataSource>jdbc\/CITB_REG01_DB<\/dataSource>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/registry.xml').with_content(/<mount path="\/_system\/config" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/config<\/targetPath>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/registry.xml').with_content(/<mount path="\/_system\/governance" overwrite="true">\n\s*<instanceId>instanceid<\/instanceId>\n\s*<targetPath>\/_desesb02\/governance<\/targetPath>/)
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/registry.xml').with_content(/<dbConfig name="wso2registry">\n\s*<dataSource>jdbc\/WSO2CarbonDB<\/dataSource>\n\s*<\/dbConfig>/)
    end
    # user-mgt.xml
    it do
      should contain_file('/opt/app/des/citb/desesb02b/repository/conf/user-mgt.xml').with(
        :ensure  => 'present',
        :owner   => 'deslive',
        :group   => 'des',
        :mode    => '0755',
        :notify  => 'Service[desesb02b]'
      ).with_content(/<Property name=\"dataSource\">jdbc\/CITB_USERS_DB<\/Property>/)
    end 
  end
end
