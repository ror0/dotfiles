if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	echo -n "WM: "; read wm
	if [[ -z $wm ]]; then
	else
		exec startx $HOME/.xinitrc $wm
	fi
fi
