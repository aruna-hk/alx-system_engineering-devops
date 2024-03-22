package { 'flask':
  ensure => installed,
}

exec { 'get_flask':
  command => '/usr/bin/pip3 install Flask==2.1.0',
  unless  => '/usr/bin/pip3 show Flask',
  require => Package['flask'],
}

