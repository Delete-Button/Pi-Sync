#/bin/bash/!
# ajaxx . delete-button

# This is an automated script that: 
# Grabs an XMl file from a network drop, backs up the webserver, applies the xml to the 
# content folder and cleans up after itself

# Time to grab the running config, if anything goes wrong we have a back up!
if [ ! -d ~/.webbackup/ ]; then
  mkdir ~/.webbackup/;
  mkdir ~/.webbackup/webdata/;
  mkdir ~/.webbackup/mntpoint/;
fi

cp -r /usr/share/nginx/www/ ~/.webbackup/
# Using the cred file instead of passing creds through the script
sudo mount -t cifs '\\vista-akchin\VISTA\Extracts\ExtractResults\' /home/pi/.webbackup/mntpoint/ -o cred=/root/.cred/.cred
# Copy, mv will cripple the whole building; cp makes it happy
cp /home/pi/.webbackup/mntpoint/NCRBOXOFCXML/boxofcxml.001 /usr/share/nginx/www/

# sudo, because linux trusts no one
sudo umount /home/pi/.webbackup/mntpoint/

# We do NOT want this to be mounted for a long time, ALERT.txt will pop up 
FILES=( /home/pi/.webbackup/mntpoint/* )
if [ ${#files[@]} -gt 0 ]; then 
  sudo umount /home/pi/.webbackup/mntpoint/;
  touch /home/pi/Desktop/ALERT.txt
  echo 'XML-Grab Folder is Still mounted!' > /home/pi/Desktop/ALERT.txt
  echo "use `umount /home/pi/.webbackup/XML-Grab/` and troubleshoot from there" >> /home/pi/Desktop/ALERT.txt
fi

