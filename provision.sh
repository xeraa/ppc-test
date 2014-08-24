#!/usr/bin/env bash

echo "Get current package references"
sudo apt-get update

echo "Install nginx and PHP"
sudo apt-get install nginx php5-fpm -y

echo "Enable PHP inside the nginx config"
sudo cp /home/vagrant/logout/default /etc/nginx/sites-available/default
sudo service nginx restart

echo "Get PCC"
cd /usr/share/nginx/
sudo chown vagrant:vagrant html
cd html/
wget https://raw.githubusercontent.com/sektioneins/pcc/master/phpconfigcheck.php

echo "Allow global access to the file"
sed 's/^\/\/ putenv("PCC_ALLOW_IP=\*");$/putenv("PCC_ALLOW_IP=\*");/' phpconfigcheck.php > phpconfigcheck-allow.php

echo "All done, check http://127.0.0.1:8080/phpconfigcheck-allow.php"
