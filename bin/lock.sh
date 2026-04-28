#!/usr/bin/bash

if [[ $XDG_SESSION_TYPE == "wayland" ]]; then
	echo "yay"
else
	import -screen -window root -silent png:- | magick png:- -scale 5% -scale 2000% -depth 8 png:- | magick png:- $HOME/pics/lock.png -gravity center -composite RGB:- | i3lock -u --raw 1920x1080:rgb -i /dev/stdin
fi
