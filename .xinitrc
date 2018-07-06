#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# System resources & keyboard mappings.
#if [ -f $sysresources ]; then
#    xrdb -merge $sysresources
#fi
#if [ -f $sysmodmap ]; then
#    xmodmap $sysmodmap
#fi

# Home-directory resources & keyboard mappings.
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# Run xinit scripts.
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Keyboard and display.
setxkbmap gb && xset r rate 200 40
pgrep redshift &> /dev/null || redshift &> /dev/null &

# Window manager.
awesome
