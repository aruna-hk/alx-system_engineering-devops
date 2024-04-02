#web server puppet manifest

$s_content = "#server configuration

server {
	#listening ports and ip all ips
	listen 80 default_server;
	listen [::]:80 default_server;

	#server root directory
        root /var/www/html;

	#server name
	server_name _;

	#server custome header
	add_header X-Served-By \$hostname;

	#error page
	error_page 404 /404.html;

	#server redirect block
	location /redirect_me/{
		return 301;
	}

	#server home
	location / {
		try_files \$uri \$uri/ =404;
	}
}
"

$landing_page = "Hello World!\n"
$error_page = "Ceci n'est pas une page\n"

package {'nginx':
  ensure => installed,
}

file {'config':
  ensure  => 'file',
  path    => '/etc/nginx/sites-available/default',
  require => Package['nginx'],
  content => $s_content,
  notify  => Service['nginx'],
}

file { 'data directory':
  ensure  => 'directory',
  path    => '/var/www/html',
  require => Package['nginx']
}

file {'page':
  ensure  => 'file',
  path    => '/var/www/html/index.html',
  content => $landing_page,
  require => Package['nginx'],
  notify  => Service['nginx'],
}

file {'error':
  ensure  => 'file',
  path    => '/var/www/html/404.html',
  content => $error_page,
  require => Package['nginx'],
  notify  => Service['nginx'],
}

service {'nginx':
  ensure => 'running',
  enable => 'true',
}
