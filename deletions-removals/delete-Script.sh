#/bin/bash/!
# ajaxx . delete-button
#Deletes all traces of script / keys / configuration on host
echo 'Input the Script Name (Pi-Sync_*Your Input*.sh)'
read scriptName
echo 'Input the ssh Keyname'
read sshKeyName
# Removes the script and key from system 
rm /home/pi/.rsync/Pi-Sync_$scriptName.sh
rm /home/pi/.ssh/$sshKeyName 
echo 'The following page will allow you to modifiy the Configurations for'
echo 'automated script actions, find the line that ends with Pi-Sync_*Your Input*.sh'
echo 'and delete it. Then Press: Ctrl+O folowed by Ctrl+X to save changes'
echo 'Press enter to continue'
read
crontab -e 
echo 'Script, ssh Key, and Cron Table entry have all been deleted'