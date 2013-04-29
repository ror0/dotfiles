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
xset +fp /usr/share/fonts/
xset +fp /usr/share/fonts/local
xset fp rehash

# Parse the .Xresources file at startx
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Parse the .Xmodmap file at startx
xmodmap ~/.Xmodmap

DEFAULT_SESSION=dwm
case $1 in
        dwm)
                ~/bin/dwminit
                ;;
        awesome)
                exec awesome
                ;;
	wmfs)
		exec wmfs
		;;
        *)
                if [ "${DEFAULT_SESSION}" == "dwm" ]
                then
                        ~/bin/dwminit
                else
                        exec $DEFAULT_SESSION
                fi
                ;;
esac
