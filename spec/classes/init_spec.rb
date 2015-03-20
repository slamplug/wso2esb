require 'spec_helper'
describe 'wso2esb' do
  context 'RedHat install with a single instance in hiera' do
    let(:params) { {:ensure => 'present',
                    :instances => {'desesb01m' =>
                      { 'ensure' => 'present', 
                        'des_package_name' => 'desesb-data-4.8.1_1.0.0', 
                        'tier' => 'data', 
                        'subdomain' => 'mgt', 
                        'server_name' => 'desesb01m'
                      }
                    },
                    :wso2_user => 'testuser',
                    :wso2_group => 'testgroup'
                 } }
    let(:facts) { {:operatingsystem => 'RedHat'} }
  
    it { should contain_class('wso2esb') }

      it { should contain_common__local_groups('testgroup').with(
        :ensure           => 'present',
        :system           => 'true'
      )}

      it { should contain_common__local_users('testuser').with(
        :ensure           => 'present',
        :service_account  => 'true',
        :comment          => 'Service account for testuser',
        :gid              => 'testgroup',
        :force_password   => 'true'
      )}

      it { should contain_file('/var/log/des').with(
        :ensure           => 'directory',
        :owner            => 'testuser',
        :group            => 'testgroup',
        :mode             => '0755'
      )}

      it { should contain_lvm__logical_volume('lvdeslog').with(
        :ensure           => 'present',
        :volume_group     => 'vgroot',
        :size             => '512M',
        :mountpath        => '/var/log/des'
      )}
  end
 end