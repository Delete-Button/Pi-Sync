#/bin/bash/!
echo 'This script is meant for the deletion of a specific script from the Cron Table'
echo 'Input the script name that needs to be deleted (Pi-Sync_*Your Input*.sh)'
read scriptName
crontab -l > runTab
toRemove="$(grep $scriptName runTab)"
while read line; do
    if [[ "$line" == "0 5 * * * /home/pi/Documents/Pi-Sync/Pi-Sync_$scriptName.sh" ]]; then
        sed -i "${n}"d runTab
        crontab runTab
        exit
    else
        echo 'No such script is automated'
        n=$((n+1))
     fi
done < runTab
rm runTab
