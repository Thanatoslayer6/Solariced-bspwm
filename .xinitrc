#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then

    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then

    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
#loads wallpaper, cursor, notification daemon, picom and bspwm
#~/.config/bspwm/scripts/wallpapersetter.sh
xsetroot -cursor_name left_ptr
picom -f &
mpDris2 &  #for mpd 
udiskie -A & #for usb notifs and such  
/usr/local/bin/dynamic.sh #run dynmaic theme changer at startup
exec bspwm
