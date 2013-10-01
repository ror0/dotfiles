export PANEL_FIFO="/tmp/panel-fifo"
export PATH="${PATH}:/home/rohan/bin:/home/rohan/bin/bar:/home/rohan/bin/dmenu:/home/rohan/bin/bar/scripts"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export XDG_CONFIG_HOME="/home/rohan/.config"

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
