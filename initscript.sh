#/bin/bash!
#version 1, it has no error handling so don't 
#type in anything wrong or you have to start over
echo 'Name the SSH Key'
read sshKeyname
ssh-keygen -b 2048 -t rsa -f $sshKeyname 
echo 'Input the IP of the remote Pi'
read IP
scp $sshKeyname.pub pi@$IP:~/
scp remotescript.sh pi@$IP:~/
ssh -T pi@$IP "cd ~; chmod 700 remotescript.sh; ./remotescript.sh $sshKeyname; exit;"
mv $sshKeyname ~/.ssh/
echo ' Time for the Automated Script'
echo '*******************************'
echo 'Input a Script name'
read scriptName
echo 'Input a Source Directory (from the following)'
ls /home/pi/Desktop/PiShare/
read srcPath
touch Pi-Sync_$scriptName.sh
echo '#/bin/bash!' >> Pi-Sync_$scriptName.sh
echo "rsync --progress -avz --delete-before -e \"ssh -i /home/pi/.ssh/$sshKeyname\" /home/pi/Desktop/PiShare/$srcPath/ pi@$IP:/home/pi/Desktop/Share/" >> Pi-Sync_$scriptName.sh 
chmod 700 Pi-Sync_$scriptName.sh
./Pi-Sync_$scriptName.sh
crontab -l > tmpCron
echo "0 5 * * * /home/pi/Documents/Pi-Sync/Pi-Sync_$scriptName.sh" > tmpCron
crontab tmpCron 
rm tmpCron 
rm $sshKeyname.pub
echo 'die' 
