#/bin/bash/!
# ajaxx . delete-button

#Script to change the number of minutes between syncs of a script
echo 'This script only functions when the script being changed has not had its Cron Table entry changed'
echo 'Input the name of the script that needs to have its timing altered (Pi-Sync_*Your input*.sh)'
read scriptName
echo 'Input the new number of minutes between syncs (as a number, i.e 5)'
read newTime
crontab -l > runTab
# Uses sed to find the line in question and replace it with a line featuring the new time
sed -i "s/0 5 * * * \/home\/pi\/.rsync\/Pi-Sync_$scriptName.sh/0 $newTime * * * \/home\/pi\/.rsync\/Pi-Sync_$scriptName.sh/g" runTab
crontab runTab
rm runTab
echo "Time inbetween syncs has been changed to $newTime"