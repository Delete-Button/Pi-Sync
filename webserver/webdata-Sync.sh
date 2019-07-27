#/bin/bash!
# ajaxx . delete-button
mount -t cifs '//192.168.240.239/web/' /home/pi/testfolder -o cred=/home/pi/.ff
cp -r /home/pi/testfolder/* /usr/share/nginx/www/
umount /home/pi/testfolder/ 
service nginx restart 
service php7.2-fpm restart
echo 'Done, Thanks Bubbs'
exit