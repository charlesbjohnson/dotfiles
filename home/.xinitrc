#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

export DE=gnome # For file associations (particularly Dropbox->Open folder)

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
syndaemon -k -i 1 -d &
nitrogen --restore &
compton --config ~/.config/compton.conf -b
tint2 &
xfce4-volumed
volumeicon &
xfce4-clipman &
xscreensaver -no-splash &
redshift -l 41.0:-73.6 &
thunar --daemon &

exec dbus-launch openbox-session
