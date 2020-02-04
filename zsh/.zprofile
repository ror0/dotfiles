if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	echo -n "WM: "; read wm
	exec startx $HOME/.xinitrc $wm
fi
