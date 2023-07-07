# Puppet script to add a custom header to nginx and configure a server as needed
# Install Nginx package
package { 'nginx':
  ensure => installed,
}

# Configure Nginx
file { '/etc/nginx/conf.d/custom.conf':
  ensure  => present,
  owner   => "$USER",
  group   => "$USER",
  # mode    => '0644',
  content => "
    server {
      listen 80;
            
      location / {
        add_header X-Served-By "${hostname}";
        root /var/www/html;
        index index.html;
      }
    }
  ",
  require => Package['nginx'],
}

# Restart Nginx service after configuration changes
service { 'nginx':
  ensure    => running,
  enable    => true,
  subscribe => File['/etc/nginx/conf.d/custom.conf'],
}
