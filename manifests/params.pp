# === Class: wso2esb::params
#
# WSO2 WSO2 Enterprise Service Bus module parameters.
#
# === Parameters
#
# NONE
#
# === Examples
#
# class wso2esb inherits wso2esb::params {
# }
#
# === Authors
#
# Simon Lamplugh <simon.lamplugh@hmrcaspire.com>
#
class wso2esb::params {
  $wso2_version             = '4.8.1'
  $des_root                 = '/opt/app/des'
  $wso2_user                = 'deslive'
  $wso2_group               = 'des'
  $apache_user              = 'apache'
  $apache_group             = 'apache'
  $apache_port              = '10080'
  $svn_username             = 'svnsync'
  $svn_password             = '593d986f36e569abc78b0ded8d13a2dd'
  
  # Parameters relating to Logs Mount Point
  $lv_group                 = 'vgroot'
  $log_lv_name              = 'lvdeslog'
  $log_size                 = 512M
  $des_logs_root            = '/var/log/des'

  # Parameters relating to Data Mount Point
  case $::operatingsystem {
    'RedHat': {
      $physical_volumes     = '/dev/sda3'
    }
    'CentOS': {
      $physical_volumes     = '/dev/sda2'
    }
    default: {
      fail("The module is not supported on ${::operatingsystem} based systems")
    }
  }
  $data_volume_group        = 'vgdata'
  $data_lv_name             = 'lvedesdata'
  $data_size                = 2G
}
