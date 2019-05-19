#/bin/bash!
#version 1, it has no error handling so don't 
#type in anything wrong or you have to start over
echo 'Name the SSH Key'
read sshKeyname
ssh-keygen -b 2048 -t rsa -f $sshKeyname -P -N
echo 'Input the IP of the remote Pi'
read IP
echo 'Input the Path to the destination folder'
read destPath
scp $sshKeyname pi@$IP:$destPath
ssh pi@$IP 'cd ~; touch .ssh/authorized_keys; chmod 600 .ssh/authorized_keys; cd  $destPath; cat $sshKeyname >> ~/.ssh/authorized_keys;'
