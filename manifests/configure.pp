class statusdashboard::configure {
  # Generate the configuration file

  Class['statusdashboard::install'] -> Class['statusdashboard::configure']
}
