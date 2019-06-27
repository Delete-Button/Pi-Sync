# Welcome to the Pi-Sync Repositiory!

## This repo holds the following
- Initscript.sh
- remotescript.sh
- README.md
- config-Sync.sh
- config-Crontab.sh
- delete-Crontab.sh
- delete-Script.sh
- xml-Grab.sh
## Purpose
To allow for a seamless and automated upadating / syncing of linux machines utilizing rsync, hardcoded directories and users,
  as well as the initialization and configuration of SSH Keys between the host machine and remote machines.  

## Programs Needed
- Initscript calls for: 
  - `scp`, 
  - `ssh`,
  - `rsync`, 
  - `crontab`, 
  - `echo`, 
  - `chmod` 
- remotescript calls for: 
  - `chmod`, 
  - `cat`
- config/Delete-Sync calls for: 
  - `echo`
  - `rm` 
- config/Delete-Crontab calls for: 
  - `crontab`, 
  - `rm`, 
  - `echo`
- xml-Grab calls for: 
  - `cp`,
  - `mv`,
  - `mount`,
  - `umount`
## Explanation
  The signage works in one of two ways: either a chromium page that displays certain content, or a source folder on the device that shows videos/pictures.
  This repo / solution has systems in place for both. 
  ### Chromium
  Firstly, the chromium page. This is solved using two services: `nginx` and `php7.2-fpm`. These provide pages on the servers ip address that the pis can connect to and broadcast.

  This uses `cron` to scedule the times at which certain files need to be grabbed from `vista-akchin` and adds them to the webserver's data.
  ### Syncing
  Secondly, the source folder. By using `rsync` and ssh keys the files that need to be sent to the pis are done so securely and in a timely fashion. 
  
  This uses `cron` to schedule syncing times between pis and the server.

## Basic Instructions
In order to begin using the scripts, enter the directory that holds _both_ the `initscript.sh` and `remotescript.sh` then type `chmod     700 initscript.sh` this will allow `initscript.sh` to be run on the host machine; then type `./initscript.sh` in order to execute the   script
    
The script will then popup in the terminal with instructions / commands that require interaction in order to continue. 
  Follow them until `initscript.sh` types into the terminal "Script Created, Syncing Ready"
    
- If changes need to be made to a script *post* its creation, use the `config-Sync.sh` Script you *must* type 
  `chmod 700 config-Sync.sh`   in order to execute it 

- If a script needs to be taken off of the Cron Table then use the `config-Crontab.sh` Script. You *must* type 
  `chmod 700 config- Sync.sh` in order to execute it  

## Troubleshooting
If anything goes **_wrong_**, remember a few key commands and things to look out for 
- Confirm that ssh is running on the _remote_ machine and that ssh is installed on the _host_
- If ssh is installed and the script still doesn't work, try deleting the `~/.ssh/` folder on the _remote_ machine, then trying again
        - This can be done by typing in the following on the _remote_ machine: `cd ~`, `rm -rf .ssh/`
- Confrim that scp is installed on the _host_ machine
        - If running Manjaro / arch, run `pacman -Fs scp` then install the package that is displayed 
        - If running debian / raspbian, run `apt-cache search scp` then install the package that is displayed
        
- You will need to know the password of the hardcoded account of the _remote_ machine, this is `pi` until a change has been noted

 - All inputs into the scripts are not checked for faults or incorrect inputs, if a script fails quickly after executing it may be because of this
 
- Make sure to check the `~/.ssh/` folder on both the _remote_ and _host_ machines 

- If the script fails at the `crontab` section, confirm what is in the crontab file by typing `crontab -l > runTab` then `nano runTab` if there is a new entry then delete the line using nano, then type `crontab runTab`



//https://help.github.com/en/articles/basic-writing-and-formatting-syntax

//ajaxx . delete-button