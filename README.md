# Welcome to the Pi-Sync Repositiory!

## This repo holds the following 
- Initscript.sh
- remotescript.sh
- README.md
- config-Sync.sh
- config-Crontab.sh

## Purpose:
To allow for a seamless and automated upadate / syncing of linux machines utilizing rsync, hardcoded directories and users,
  as well as the initialization and configuration of SSH Keys between the host machine and remote machines. 

## Programs Needed
Initscript calls for: 
- `scp`, 
- `ssh`,
- `rsync`, 
- `crontab`, 
- `echo`, 
- `chmod` 
remotescript calls for: 
- `chmod`, 
- `cat`
config-Sync calls for: 
- `echo` 
config-Crontab calls for: 
- `crontab`, 
- `rm`, 
- `echo`

## Basic Instructions
In order to begin using the scripts, enter the directory that holds _both_ the `initscript.sh` and `remotescript.sh` then type `chmod     700 initscript.sh` this will allow `initscript.sh` to be run on the host machine; then type `./initscript.sh` in order to execute the   script.
    
The script will then popup in the terminal with instructions / commands that require interaction in order to continue. 
  Follow them until `initscript.sh` types into the terminal "Script Created, Syncing Ready"
    
- If changes need to be made to a script *post* its creation, use the `config-Sync.sh` Script you *must* type 
  `chmod 700 config-Sync.sh`   in order to execute it. 

- If a script needs to be taken off of the Cron Table then use the `config-Crontab.sh` Script. You *must* type 
  `chmod 700 config- Sync.sh` in order to execute it.  

## Troubleshooting
If anything goes **_wrong_**, remember a few key commands and things to look out for 
- Confirm that ssh is running on the remote machine and that ssh is installed on the host
- If ssh is installed and the script still doesn't work, try deleting the `~/.ssh/` folder on the _remote_ machine, then trying again
        - This can be done by typing in the following: `cd ~`, `rm -rf .ssh/`
- Confrim that scp is installed on the _host_ machine
        - If running Manjaro / arch, run `pacman -Fs scp` then install the package that is displayed 
        - If running debian / raspbian, run `apt-cache search scp` then install the package that is displayed
        
- You will need to know the password the hardcoded account of the _remote_ machine, this is `pi` in the current version in order to pass   the scp commands and the initial scp command

 - All inputs into the scripts are not checked for faults or incorrect inputs, if the scripts fail early into the process it may be        because of this.
 
- Make sure to check the `~/.ssh/` folders of both the _remote_ and _host_ machines and deleting anything that was not in either before   you ran the program

- If the script fails at the `crontab` section, confrim what is in the crontab file by typing `crontab -l > runTab` then `nano runTab`     if there is a new entry then delete the line using nano, then type `crontab runTab`.



//https://help.github.com/en/articles/basic-writing-and-formatting-syntax

//ajaxx . delete-button
