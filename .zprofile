export PANEL_FIFO="/tmp/panel-fifo"
export PATH="${PATH}:${HOME}/bin:${HOME}/bin/bar:${HOME}/bin/dmenu:${HOME}/bin/bar/scripts"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export XDG_CONFIG_HOME="${HOME}/.config"


[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec weston-launch
