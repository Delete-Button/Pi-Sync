#/bin/bash!
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
sudo mv default.conf /etc/nginx/conf.d/
## need to test before deployment
sudo echo "php_admin_value[date.timezone] = America/Phoenix" > /etc/php/7.2/fpm/pool.d/www.conf
sudo apt install samba 
sudo mkdir /samba
sudo chgrp sambashare /samba
