#/bin/bash!
#ajaxx . delete-button 
echo -n "$1 just synced from $2 at " >> Pi_Guest-List.txt
date >> Pi_Guest-List.txt
rsync --progress -avz --delete-before -e "ssh -i /home/pi/.ssh/.PiServer" /samba/pi/pishare/$2/ pi@$1:/home/pi/Desktop/share
