#/bin/bash/!
# ajaxx . delete-button
# Executes commands allowing for the modification of Crontab for the logged in user
clear 
echo 'What is the name of the Pi you want to Modifiy?'
read hostName
clear
crontab -l | grep $hostName
echo "Please confirm, by hitting enter, that the text above ends with 'Pi-Sync_"$hostName
read
clear
echo 'The following page will allow you to modifiy the Configurations for'
echo "automated script actions. Find the line that ends with Pi-Sync_$hostName.sh"
echo 'and change the number 5 in the line. Then Press: Ctrl+O folowed by Ctrl+X to save changes'
echo "EXAMPLE:"
echo "*/5 * * * * /home/pi/.rsync/Pi-Sync_PiShovel.sh"
echo "All you change is the 5"
echo "*/15 * * * * /home/pi/.rsync/Pi-Sync_PiShovel.sh"
echo "Now, rather than resync every 5 minutes, it will sync every 15 minutes"
echo 'Press enter to continue and be brought to the Configuration Modification Page'
read
crontab -e 