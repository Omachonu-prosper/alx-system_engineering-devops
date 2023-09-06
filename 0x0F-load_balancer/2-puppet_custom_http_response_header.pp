# Puppet script to add a custom header to nginx and configure a server as needed
# Install Nginx package
exec {'custom-header'
  command => 'sudo apt-get update
              sudo apt-get -y install nginx
              # sudo chown -R $USER /etc/nginx/sites-available/
              sudo echo "server {
                listen 80 default_server;
                listen [::]:80 default_server;
                server_name _;
                add_header X-Served-By \$hostname;
                root /var/www/html;
                index index.html index.htm index.nginx-debian.html;
              }" > /etc/nginx/sites-available/default
              sudo service nginx restart',
  provider => shell
}
