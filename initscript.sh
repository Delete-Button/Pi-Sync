#/bin/bash!
#version 1, it has no error handling so don't 
#type in anything wrong or you have to start over
#Set the Name of the SSH Keys
echo 'Name the SSH Key'
read sshKeyname
echo 'Hit enter when prompted'
ssh-keygen -b 2048 -t rsa -f $sshKeyname 
#Set the IP address of the remote Pi
echo 'Input the IP of the remote Pi'
read IP
#pushes the key and the remote script to the pi
#Requires input from user for initial authentication
scp $sshKeyname.pub remotescript.sh pi@$IP:~/
#Also requires authentication from user, sets remotescript to executable, executes, and exits
ssh -T pi@$IP "cd ~; chmod 700 remotescript.sh; ./remotescript.sh $sshKeyname; exit;"
#Moves the private key somewhere better than wherever this is executed
mv $sshKeyname ~/.ssh/
#This builds the script that will run rsync for each Pi
echo ' Time for the Automated Script'
echo '*******************************'
echo 'Input a Script name'
read scriptName
#This is the directory from which the pi will sync up to
echo 'Input a Source Directory (from the following)'
ls /home/pi/Desktop/PiShare/
read srcPath
#Creates the new script, makes it executeable and executes it
touch Pi-Sync_$scriptName.sh
echo '#/bin/bash!' >> Pi-Sync_$scriptName.sh
echo "rsync --progress -avz --delete-before -e \"ssh -i /home/pi/.ssh/$sshKeyname\" /home/pi/Desktop/PiShare/$srcPath/ pi@$IP:/home/pi/Desktop/Share/" >> Pi-Sync_$scriptName.sh 
chmod 700 Pi-Sync_$scriptName.sh
./Pi-Sync_$scriptName.sh
#Sets it on the user's time table to be run every 5 minutes
crontab -l > tmpCron
echo "0 5 * * * /home/pi/Documents/Pi-Sync/Pi-Sync_$scriptName.sh" > tmpCron
crontab tmpCron 
#clean up the garbage files
rm tmpCron 
rm $sshKeyname.pub
echo 'Script Created, Syncing ready' 
