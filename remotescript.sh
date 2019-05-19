#/bin/bash!
#accidentally deleted the file so this is a rewrite
sshKeyName=$1
cd ~
if [ ! -d .ssh ]; then mkdir .ssh/; fi
chmod 700 .ssh/
mv $sshKeyName.pub ~/.ssh/
cd ~/.ssh/
if [ ! -f authorized_keys ]; then touch authorized_keys; fi 
chmod 600 authorized_keys
cat $sshKeyName.pub >> authorized_keys
cd ~
rm remotescript.sh
