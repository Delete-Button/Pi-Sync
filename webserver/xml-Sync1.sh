#/bin/bash/!
# ajaxx . delete-button

# This is an automated script that: 
# Grabs an XMl file from a network drop, backs up the webserver, applies the xml to the 
# content folder and cleans up after itself

# Time to grab the running config, if anything goes wrong we have a back up!
if [ ! -d ~/.webbackup/ ]; then
  mkdir ~/.webbackup/;
fi
cp -r /var/www/test.com/ ~/.webbackup/

# i hate using hardcoded passwords ,,, so here's some hardcoded passwords
# need to find places for files ,, maybe an encryption>>????
PASS=$()
USR=$()
DOM=$()
# Now we mount
sudo mount -t cifs '\\vista-akchin\VISTA\Extracts\ExtractResults\' /home/pi/.webbackup/mntpoint/ -o username=$USR,domain=$DOM,password=$PASS

# Copy, mv will cripple the whole building; cp makes it happy
cp /mnt/XML-Grab/NCRBOXOFCXML/boxofcxml.001 /var/www/
# sudo, because linux trusts no one
sudo umount /mnt/XML-Grab/
# if we rm -rf the folder and its still mounted,,, goodbye job
FILES=( /home/pi/.webbackup/XML-Grab/* )
if [ ${#files[@]} -gt 0 ]; then 
  sudo umount /home/pi/.webbackup/XML-Grab/;
  touch /home/pi/Desktop/ALERT.txt
  echo 'XML-Grab Folder is Still mounted!' > /home/pi/Desktop/ALERT.txt
  echo "un `umount /home/pi/.webbackup/XML-Grab/` and troubleshoot from there" >> /home/pi/Desktop/ALERT.txt

fi
# Move this new file into our working directory and replace its older versions.
mv /var/www/boxofcxml.001 /var/www/test.com/boxofcxml.001
mv /var/www/test.com/BOXFCXML.001 /var/www/test.com/BOXFCXML.xml