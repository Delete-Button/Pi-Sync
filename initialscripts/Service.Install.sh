#/bin/bash!
# ajaxx . delete-button
# Nginx and PHP Section <>
# Straight up Ripped from:
## https://www.linuxbabe.com/ubuntu/install-lemp-stack-nginx-mariadb-php7-2-ubuntu-18-04-lts
echo 'yee'
sudo apt update && sudo apt upgrade -y
sudo apt install nginx -y 
sudo apt install php7.2 php7.2-fpm php7.2-cli php-common php7.2-common php7.2-json php7.2-opcache php7.2-readline php7.2-mbstring php7.2-xml php7.2-gd php7.2-curl -y 
sudo systemctl enable nginx && sudo systemctl start nginx && systemctl status nginx
echo 'Hit enter if the above reads "nginx.service is Active (running)", CTRL + C if not'
read continue
sudo chown www-data:www-data /usr/share/nginx/html/ -R 
sudo systemctl start php7.2-fpm && sudo systemctl enable php7.2-fpm && systemctl status php7.2-fpm
echo 'Hit enter if the above reads "php7.2-fpm.service is Active (running)", CTRL + C if not'
read phpcontinue
sudo rm /etc/nginx/sites-enabled/default
sudo cp default.conf /etc/nginx/conf.d/
## need to test before deployment
sudo echo "php_admin_value[date.timezone] = America/Phoenix" >> /etc/php/7.2/fpm/pool.d/www.conf
echo 'haw'
# Samba Section <>
# Straight up Ripped from:
## https://linuxize.com/post/how-to-install-and-configure-samba-on-ubuntu-18-04/
## Not sure of exact author :^(
sudo apt update && sudo apt upgrade -y
sudo apt install samba
sudo systemctl status nmbd
echo 'Please Hit `Enter` if the above text says that the `nmbd.service` is Active and Loaded'
sudo mkdir /samba
sudo chgrp sambashare /samba
sudo useradd -M -d /samba/PiShare -s /usr/sbin/nologin -G sambashare PiShare
sudo mkdir /samba/PiShare
sudo chown PiShare:sambashare /samba/PiShare
sudo chmod 2770 /samba/PiShare
echo 'Enter a Secure Password'
sudo smbpasswd -a PiShare
sudo smbpasswd -e PiShare
sudo useradd -M -d /samba/users -s /usr/sbin/nologin -G sambashare sadmin
echo 'Enter a Secure Password'
sudo smbpasswd -a sadmin
sudo smbpasswd -e sadmin
sudo mkdir /samba/users 
sudo chown sadmin:sambashare /samba/users
sudo chmod 2770 /samba/users
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak 
sudo cat smb.conf >> /etc/samba/smb.conf 
sudo systemctl restart nmbd