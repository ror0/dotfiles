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

xrandr --auto

# Remove computer beep at boot
xset -b

# Parse the .Xresources file at startx
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec i3
#exec openbox-session

