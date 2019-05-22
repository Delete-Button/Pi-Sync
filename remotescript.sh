#/bin/bash!
# Accidentally deleted the file so this is a rewrite
# sshKeyName is the name of the key made and is passed from initscript into this when run on the target / remote machine
sshKeyName=$1
# This is to confirm the pwd
cd ~
# This is to check for the `.ssh/` folder, and to make it if it doesn't already exist
if [ ! -d .ssh ]; then mkdir .ssh/; fi
# Adds permissions to thte `.ssh/` folder, and moves the public key into it, then moves the pwd into `.ssh/`
chmod 700 .ssh/
mv $sshKeyName.pub ~/.ssh/
cd ~/.ssh/
# Checks for the authorized_keys file, makes it if it needs to
if [ ! -f authorized_keys ]; then touch authorized_keys; fi 
# Confirms permissions of the `authorized_keys` file and appends the public key to it
chmod 600 authorized_keys
cat $sshKeyName.pub >> authorized_keys
#Changes the pwd so that the script can delete itself off of the target / remote machine
cd ~
rm remotescript.sh
