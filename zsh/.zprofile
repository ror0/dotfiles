[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec ssh-agent startx
