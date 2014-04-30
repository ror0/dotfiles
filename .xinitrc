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

# Remove computer beep at boot
xset -b

# Set font directory
#xset +fp /usr/share/fonts/
#xset +fp /usr/share/fonts/local
#xset fp rehash

# Parse the .Xresources file at startx
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Setup dual screens
#xrandr --output VGA1 --mode 1280x1024 --output LVDS1 --mode 1366x768 --left-of VGA1

DEFAULT_SESSION=bspwm
#case $1 in
case $DEFAULT_SESSION in
        openbox)
                exec openbox-session
                ;;
        bspwm)
		sxhkd &
		exec bspwm
                ;;
        *)
		exec dwm
                ;;
esac
