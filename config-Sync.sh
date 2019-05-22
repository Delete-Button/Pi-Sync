#/bin/bash/!
#Allows for the configuration of Sync Scripts post creation
echo 'Please enter the name of the script (Pi-Sync_*input*.sh)'
read scriptName
echo 'This is the current configuration, Press ctrl+C if you do not wish to make changes, otherwise hit enter'
sed 2q;d Pi-Sync_$scriptName.sh
read
echo 'Input the IP address'
read IP
echo 'Input the ssh Key name'
read sshKeyName
echo 'Input the Source Directory (from the following as written)'
ls /home/pi/Desktop/PiShare/
read srcPath
echo "IP: $IP, ssh Keyname: $sshKeyName, Source Directory: Pishare/$srcPath/"
echo 'Are these inputs correct? (Hit enter to continue)'
read 
echo 'Reconfiguring Script'
echo '#/bin/bash!' > Pi-Sync_$scriptName.sh
echo "rsync --progress -avz --delete-before -e \"ssh -i /home/pi/.ssh/$sshKeyname\" /home/pi/Desktop/PiShare/$srcPath/ pi@$IP:/home/pi/Desktop/Share/" >> Pi-Sync_$scriptName.sh
echo 'Reconfigure Complete'