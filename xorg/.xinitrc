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

# Make sure that the session type is set correctly
export XDG_SESSION_TYPE=X11

xautolock -time 10 -locker lock.sh &
udiskie --notify --automount --no-tray &

case $1 in
	i3)
		exec i3
		;;
	openbox)
		exec openbox-session
		;;
	*)
		exec i3
		;;
esac

