# Install Bitcasa.app into /Applications.
#
# Examples
#
#   include bitcasa

class bitcasa {
  include wget
  
  $filename = "Bitcasa_1037.pkg"
  $url      = "http://dist.bitcasa.com/${filename}"

  exec { 'Download Bitcasa':
    command => "wget -O ${filename} ${url}",
    cwd     => $boxen::config::cachedir,
    creates => "${boxen::config::cachedir}/${filename}",
    require => Package[wget],
    user    => $::luser,
  }
  ~> exec { 'Install Bitcasa':
    command     => "/usr/bin/open ${boxen::config::cachedir}/${filename}",
    logoutput   => 'on_failure',
    refreshonly => true,
  }
}
