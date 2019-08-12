@echo off
echo Rebooting Pi Server...
echo Type in Password for both Prompts
ssh -t pi@192.168.241.86 "sudo shutdown -r now"
echo Done 