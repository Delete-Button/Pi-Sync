# Welcome to the Pi-Sync Repositiory!
## This repo holds the following 
Initscript.sh
remotescript.sh
## Purpose:
    To allow for a seamless and automated upadate / syncing of linux machines utilizing rsync, hardcoded directories and users,
    as well as the initialization and configuration of SSH Keys between the host machine and remote machines. 
## Programs Needed
    Initscript calls for: scp, ssh, rsync, crontab, and chmod 
    Remote script calls for: chmod, cat 
    Both scripts require chmod in order to make each other executeable and to create `~/.ssh` and `~/.ssh/authorized_keys`
## Basic Instructions
    In order to begin using the scripts, enter the directory that holds both the `initscript.sh` and `remotescript.sh` then type `chmod 700 initscript.sh`
    this will allow `initscript.sh` to be run on the host machine; then type `./initscript.sh` in order to execute the script.
    The scripts will then popup in the terminal with instructions / commands that require interaction in order to continue. 
    Follow them until `initscript.sh` types into the terminal "Script Created, Syncing Ready"
## Troubleshooting
    If anything goes wrong, remember a few key commands and things to look out for 
    * Confirm that ssh is running on the remote machine and that ssh is installed on the host
    * * If ssh is installed and the script still doesn't work, try deleting the `~/.ssh/` folder on the _remote_ machine, then trying again
    * * This can be done by typing in the following: `cd ~`, `rm -rf .ssh/`
    
    * Confrim that scp is installed on the _host_ machine
    * * If running Manjaro / arch, run `pacman -Fs scp` then install the package that is displayed 
    * * If running debian / raspbian, run `apt-cache search scp` then install the package that is displayed

    * You will need to know the password the hardcoded account of the _remote_ machine, this is `pi` in the current version in order to pass the scp commands and the initial scp command

    * All inputs into the scripts are not checked for faults or incorrect inputs, if the scripts fail early into the process it may be because of this.
    * * Make sure to check the `~/.ssh/` folders of both the _remote_ and _host_ machines and deleting anything that was not in either before you ran the program

    * If the script fails at the `crontab` section, confrim what is in the crontab file by typing `crontab -l > runTab` then `nano runTab` if there is a new entry then delete the line using 
        nano, then type `crontab runTab`.
    