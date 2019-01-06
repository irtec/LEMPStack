#!/bin/bash
#
# edited by Iryadinata
# Web: https://irtech.net
# GitHub: https://github.com/irtec
#

echo " "
jeshile='\e[40;38;5;82m' #jeshile
jo='\e[0m' # pa ngjyra
os=$(exec uname -m|grep 64)
if [ "$os" = "" ]
then os="x86"
else os="x64"
fi
echo -e "${jeshile} ┌───────────────────────────┐ \e[0m"
echo -e "${jeshile} │  Checking System Version  │ \e[0m"
echo -e "${jeshile} └───────────────────────────┘ \e[0m"
sleep 3
echo -e "${jeshile} ┌───────────────────────────┐ \e[0m"
echo -e "${jeshile} │   Detected a $os System   │ \e[0m"
echo -e "${jeshile} └───────────────────────────┘ \e[0m"
sleep 3
echo -e "${jeshile} ┌───────────────────────────┐ \e[0m"
echo -e "${jeshile} │   Installing Web Server   │ \e[0m"
echo -e "${jeshile} └───────────────────────────┘ \e[0m"
echo " "
apt-get update && apt-get upgrade -y && apt-get install htop -y
apt-get install nginx php5-fpm lsb-release nscd curl php5 php5-mysql php5-cli php5-curl unzip curl libcurl3 libcurl3-dev php5-curl -y
sudo updatedb
sudo apt-get update
sudo apt-get install php5-dev php5-gd -y
apt-get install php5-geoip php5-fpm mcrypt php5-mcrypt php5enmod mcrypt -y
apt-get install libapr1 libaprutil1 libdbd-mysql-perl libdbi-perl libnet-daemon-perl libplrpc-perl libpq5 mysql-client-5.5 mysql-common mysql-server mysql-server-5.5 php5-common php5-mysql -y
sudo wget https://raw.githubusercontent.com/irtec/LEMPStack/master/default -O /etc/nginx/sites-available/default
mv /usr/share/nginx/html /var/www/html
sudo php5enmod mcrypt
apt-get install phpmyadmin -y
mkdir -p /var/www/html
chown www-data:www-data -R /var/www/html
sudo ln -s /usr/share/phpmyadmin /var/www/html
cd /var/www/html
sudo mv phpmyadmin nothingtosee
cd
service nginx && service php5-fpm restart
echo " "
echo -e "${jeshile} ┌──────────────────────────────────────────────────────────┐ \e[0m"
echo -e "${jeshile} │[+] Installation Completed                                │ \e[0m"
echo -e "${jeshile} └──────────────────────────────────────────────────────────┘ \e[0m"
sleep 8
