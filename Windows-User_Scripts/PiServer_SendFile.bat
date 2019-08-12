@echo off
echo Confirm that the file(s) you are sending are in the folder `Files-To-Send`
echo Press `Enter` to continue
cls
echo Enter the Location on the Pi Server that you would like to send these Files.
SET /P DIRECTORY="Home Folder (1), Webserver (2)"
IF "%DIRECTORY%"=="1" (scp -r Files-To-Send\* pi@192.168.241.234:~/)
IF "%DIRECTORY%"=="2" (scp -r Files-To-Send\* pi@192.168.241.234:/usr/share/nginx/html/Theaterboards/)
echo The files that you put into the `Files-To-Send` directory are still in it 
echo If you use this program again, make sure to clear out the directory of any 
echo files that are not meant to be sent again
SET /P TEST="(Press Enter to Close this Dialogue)"
