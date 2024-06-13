#web server puppet manifest

$s_content = "
#server configuration
user www-data;
worker_processes auto;
pid /run/nginx.pid;
error_log /var/log/nginx/error.log;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        multi_accept on;
}

http {

        sendfile on; 
        tcp_nopush on; 
        types_hash_max_size 2048;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;
        access_log /var/log/nginx/access.log;

        gzip on;

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}

"
package {'nginx':
  ensure => installed,
}

file {'config':
  ensure  => 'file',
  path    => '/etc/nginx/nginx.conf',
  require => Package['nginx'],
  content => $s_content,
  notify  => Service['nginx'],
}

service {'nginx':
  ensure => 'running',
  enable => 'true',
}
