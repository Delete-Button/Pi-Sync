#/bin/bash!
#ajaxx . delete-button
if [ ! -d ~/.config/autostart ]; then mkdir ~/.config/autostart; fi
path='~/.config/autostart'
cp x11vnc path
cp X11VNC.desktop path
echo "Please enter either another strong password or the same password used for the Pi User"
x11vnc -storepasswd