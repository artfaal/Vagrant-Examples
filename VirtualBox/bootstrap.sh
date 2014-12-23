#!/usr/bin/env bash
# Start template for Russia/Moscow

echo "Update all"
apt-get update > /dev/null
echo "Upgrade all"
sudo apt-get upgrade -y > /dev/null

echo "Change timezone to Moscow"
sudo /bin/ln -fs /usr/share/zoneinfo/Europe/Moscow /etc/localtime > /dev/null

echo "Add Russian Pack"
sudo apt-get install -y language-pack-ru  > /dev/null