#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

hlwm=$HOME/.herbstluftwm
hlwm_log=$hlwm/log

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

# Keybiard layout
setxkbmap se

# Make screen blank after 10 minutes of inactivity
xset s on +dpms

# Lock screen, with slock, after 10 minutes of inactivity
xautolock -time 10 -locker slock &

if [ ! -d "$hlwm" ]; then
 mkdir $hlwm
 touch $hlwm_log
elif [ ! -f $hlwm_log ]; then
 touch $hlwm_log
fi

herbstluftwm &> $hlwm_log
