:: ajaxx . delete-button
@echo off
:: Runs the `webserver/xml-Sync.sh` script
echo Syncing Pi Server with Vista...
set /p choice=...This will delete all of Bubbs' Changes are you sure? (Hit Y to continue or N to Exit)
if /I '%choice%' == 'N' exit
if /I '%choice%' == 'Y' echo Continuing
echo Type in Password for both Prompts
ssh -t pi@192.168.240.239 "cd ~/Pi-Sync/webserver/; sudo ./xml-Sync.sh; exit;"
echo Done 