class statusdashboard::service {
  # service {
  # "statusdashboard" :
  # 	ensure => running,
  # 	enable => true,
  # 	hasstatus => true,
  # 	hasrestart => true,
  #}
  Class['statusdashboard::configure'] ~> Class['statusdashboard::service']
}

