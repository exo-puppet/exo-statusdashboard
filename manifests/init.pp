################################################################################
#
#   This module manages the statusdashboard application
#   https://github.com/exoplatform/statusdashboard
#
#   Tested platforms:
#    - Ubuntu 11.04 Natty
#
# == Parameters
#
# [+user+]
#   the user account under which the application must be installed
#
#
# == Modules Dependencies
#
# [+nodejs+]
#   the +nodejs+ puppet module is needed to :
#   
#   - install nodejs binaries 
#   - manage modules using npm
#
# [+git+]
#   the +git+ puppet module is needed to :
#   
#   - install git binaries
#   - clone an existing git repository
#   - pull updates from a remote repository
#
# == Examples
#
#  The user account must be created previously
#  class {
#    "statusdashboard" :
#      user => "statusdashboard",
#  }
#
################################################################################
class statusdashboard ($user) {

    include statusdashboard::params include statusdashboard::install, statusdashboard::configure, statusdashboard::service
}