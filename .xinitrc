#!/bin/sh
# Configure the executed X Window System server, then start the primary client
# program. The script will continue when the primary client exits, indicating
# that the user has finished and that xinit should now exit.

systemResources=/etc/X11/xinit/.Xresources
systemModmap=/etc/X11/xinit/.Xmodmap
userResources=${HOME}/.Xresources
userModmap=${HOME}/.Xmodmap

# System resources & keyboard mappings.
#if [ -f $sysresources ]; then
#    xrdb -merge $sysresources
#fi
#if [ -f $sysmodmap ]; then
#    xmodmap $sysmodmap
#fi

# User resources & keyboard mappings.
if [ -f "$userResources" ]; then
    xrdb -merge "$userResources"
fi
if [ -f "$userModmap" ]; then
    xmodmap "$userModmap"
fi

# Run system xinitrc scripts.
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Execute programs before the primary client.
# [ -f /etc/X11/xprofile ] && . /etc/X11/xprofile
[ -f ${HOME}/.xprofile ] && . ${HOME}/.xprofile

# Execute the primary client in the foreground.
exec xmonad
