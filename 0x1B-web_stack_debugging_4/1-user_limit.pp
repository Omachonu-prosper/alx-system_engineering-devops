# Change the OS configuration so that it is possible to login with the holberton user
exec { '/usr/bin/env sed -i "s/holberton/foo/" /etc/security/limits.conf': }
