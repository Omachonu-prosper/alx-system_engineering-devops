# Puppet script to add a custom header to nginx and configure a server as needed
# Install Nginx package and configure a custom header
exec {'custom-header'
  command => 'sudo apt-get update -y;
	  sudo apt-get install nginx -y;
	  sudo sed -i "/server_name _/a add_header X-Served-By $hostname;" /etc/nginx/sites-available/default
	  sudo service nginx restart',
  provider => shell
}
