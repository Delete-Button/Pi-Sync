#/bin/bash/!
# ajaxx . delete-button
#Deletes all traces of script / keys / configuration on host
echo 'Input the Script Name (Pi-Sync_*Your Input*.sh)'
read scriptName
echo 'Input the ssh Keyname'
read sshKeyName
# Removes the script and key from system 
rm /home/pi/.rsync/Pi-Sync_$scriptName.sh
rm /home/pi/.ssh/sshKeyName 
crontab -l > runTab
# This loop is documented in the `delete-Crontab` script
while read line; do
    if [[ "$line" == "*/5 * * * * /home/pi/.rsync/Pi-Sync_$scriptName.sh" ]]; then
        sed -i "${n}"d runTab 
        crontab runTab
        exit
    else
        n=$((n+1))
     fi
done < runTab
rm runTab
echo 'Script, ssh Key, and Cron Table entry have all been deleted'