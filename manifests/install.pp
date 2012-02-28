class statusdashboard::install {
    case $::operatingsystem {
        /(Ubuntu)/ : {
        # install NodeJS
            class {
                "nodejs" :
                    lastversion => true,
                    use_ppa => true,
            }
            
            file {
                ["${statusdashboard::params::statusdashboard_home}/etc",
                 "${statusdashboard::params::statusdashboard_home}/app",
                 "${statusdashboard::params::statusdashboard_home}/var",
                 "${statusdashboard::params::statusdashboard_home}/var/log",] :
                    ensure => directory,
                    owner => $statusdashboard::user,
                    group => $statusdashboard::user,
                    mode => 755,
            }
            # checkout git repo
            git::clone {
                "statusdashboard-git-repository" :
                    url => $statusdashboard::params::git_repo_url,
                    path => "${statusdashboard::params::statusdashboard_home}/app",
                    user => "$statusdashboard::user",
            }
            nodejs::npm_update {
                "statusdashboard-npm-update" :
                    path => "${statusdashboard::params::statusdashboard_home}/app",
                    user => "$statusdashboard::user",
            }
            # crontab for git pull
            # configure NPM modules (or automatically after a pull?)
            # service installation 

        }
    }
    Exec["git-clone-${statusdashboard::params::statusdashboard_home}/app"] -> Exec["npm-update-${statusdashboard::params::statusdashboard_home}/app"]
    User["statusdashboard"] -> Class['statusdashboard::install']
    Class['statusdashboard::install'] -> Class['statusdashboard::configure']
}