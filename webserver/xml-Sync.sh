eee#/bin/bash/!
# ajaxx . delete-button
#End result:
#find and replace two files, BOXFCXML.001 and .xml 
# back up the running files 
#first we grab, by mounting NAS and CPing the file that we need. 
#unmount//
#backup the old files into a hidden directory 
#move the copied file into our webserver folder
#convert to XML
#

# it needs to:
# grab, move, back up the old, replace, hide, repeat
# mount, cp, cp -> hidden Folder, mv, keep script in hidden folder and unmount the drive, crontab scheduling

# Runs a backup of the current running configuration into a hidden folder inside of var. just in case anything goes wrong
if [ ! -d ~/.webbackup/ ]; then
    mkdir ~/.webbackup/;
fi
cp -r /var/www/test.com/ ~/.webbackup/
# Now we mount the NAS device//
# Keep the bash history as clean as you can 

# Password in a hidden file + directory
PASS=$( /etc/gimp/2.0/..,/.PASS)
# Username and Domain in a hidden file + directory
USR= $( cat /etc/pacman.d/gnupg/.,./.USR )
DOM=$( cat /etc/pacman.d/gnupg/.,./.DOM )
# Common error with mount if the destination folder doesn't exist
if [ ! -d /home/pi/.webbackup/mntpoint/ ]; then 
  mkdir /home/pi/.webbackup/mntpoint/; 
fi
# Grabs the source folder and mounts it to the system 
# Requires sudo and will require a modification of the sudoers file to allow for this single 
# command to be pushed
sudo mount -t cifs '\\vista-akchin\VISTA\Extracts\ExtractResults\' /home/pi/.webbackup/mntpoint/ -o username=$USR,domain=$DOM,password=$PASS

#pseudo 
# actually grab it out of the server NAS
cp /mnt/XML-Grab/NCRBOXOFCXML/boxofcxml.001 /var/www/
#immediately unmount that system
sudo umount /mnt/XML-Grab/
##need to make a loop that will check for files before rm -rf'ing the folder
#move our new file straight into the running config 
mv /var/www/boxofcxml /var/www/test.com/BOXFCXML.001
# move the .001 into an .xml file 
mv /var/www/test.com/BOXFCXML.001 /var/www/test.com/BOXFCXML.xml
