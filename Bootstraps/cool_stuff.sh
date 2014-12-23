#!/usr/bin/env bash
# Userful thing for install.

echo "Installing PIP"
apt-get install -y python-pip python-dev build-essential
echo "Install Pillow"
apt-get install -y python-dev libjpeg-dev libjpeg8-dev libpng3 libfreetype6-dev
ln -s /usr/lib/i386-linux-gnu/libfreetype.so /usr/lib
ln -s /usr/lib/i386-linux-gnu/libjpeg.so /usr/lib
ln -s /usr/lib/i386-linux-gnu/libz.so /usr/lib
pip install PIL  --allow-unverified PIL --allow-all-external

echo "Installing Git"
sudo apt-get install git -y > /dev/null

echo 'Install MongoDB'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get install -y mongodb-org

echo 'Restore MongoDB'
#mongorestore PATH

echo "install Nginx"
sudo apt-get install nginx -y > /dev/null

echo "Updating PHP repository"
sudo apt-get install python-software-properties build-essential -y > /dev/null
sudo add-apt-repository ppa:ondrej/php5 -y > /dev/null
sudo apt-get update > /dev/null

echo "Installing PHP"
sudo apt-get install php5-common php5-dev php5-cli php5-fpm -y > /dev/null

echo "Installing PHP extensions"
sudo apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y > /dev/null

echo "Installing MYSQL"
echo "Insert password!"
password=''
sudo apt-get install debconf-utils -y > /dev/null
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password "$password
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password "$password
sudo apt-get install mysql-server -y > /dev/null
echo 'Restore from Dump'
sudo mysql -uroot -pPASSWORD < /vagrant/config/mysql.dump

echo 'Install Docker'
sudo apt-get install apt-transport-https
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sudo sh -c "echo deb https://get.docker.com/ubuntu docker main\
> /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get install -y lxc-docker