class fluentd::params {
  # package params
  $package_ensure          = 'installed'
  $package_name            = 'td-agent'
  $package_install_options = []
  # service params
  $service_manage = true
  $service_name   = 'td-agent'
  $service_ensure = 'running'
  $service_enable = true
  # config params
  $config_path = '/etc/td-agent'
  $conf_dir    = "${config_path}/conf.d"
  $config_file = "${config_path}/td-agent.conf"
  # user params
  $user_manage = true
  $user_name   = 'td-agent'
  $user_group  = 'td-agent'
  $user_groups = ['adm']
  # repo params
  $repo_gpgcheck = true
  $repo_gpgkey = 'https://packages.treasuredata.com/GPG-KEY-td-agent'
  $repo_gpgkeyid = 'BEE682289B2217F45AF4CC3F901F9177AB97ACBE'
  $repo_name = 'treasuredata'
  $repo_desc = 'TreasureData'

  case $::osfamily {
    'debian': {
      $manage_repo = true
      $distro_id = downcase($::lsbdistid)
      $distro_codename = $::lsbdistcodename
      $repo_url = "http://packages.treasure-data.com/2/${distro_id}/${distro_codename}/"
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}")
    }
  }
}
