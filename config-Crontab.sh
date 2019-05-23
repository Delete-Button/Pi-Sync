#/bin/bash/!
# ajaxx . delete-button
# This script can only delete entries from CronTab, in order to make actual changes, 
# change the information in crontab by doing `crontab -l > editTab` and `nano editTab`,
# when finished, apply changes by doing `crontab editTab`
echo '**This script is meant for the deletion of a specific script from the Cron Table**'
echo 'Input the script name that needs to be deleted (Pi-Sync_*Your Input*.sh)'
# This is how we find which line needs to be deleted
read scriptName
# Extracting the crontab data into a file called runTab (Running CronTab)
crontab -l > runTab
# A small while loop that will read through the contents of the runTab file 
# to find which line needs to be deleted, skipping and continuing on if the line 
# it's on isn't the correct one 
while read line; do
    if [[ "$line" == "0 5 * * * /home/pi/.rsync/Pi-Sync_$scriptName.sh" ]]; then
        # `sed` is commonly used for surgical deletion and insertion into files
        # here we use it to take out the line `n`, or the line that holds the 
        # configuration for the script in question from `runTab`
        echo 'Script removed from Automation'
        sed -i "${n}"d runTab
        # This applies the change to crontab 
        crontab runTab
        exit
    else
        n=$((n+1))
     fi
done < runTab
rm runTab
