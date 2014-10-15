export PANEL_FIFO="/tmp/panel-fifo"
export PATH="${PATH}:${HOME}/bin:${HOME}/bin/bar:${HOME}/bin/dmenu:${HOME}/bin/bar/scripts:${HOME}/.luarocks/bin"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export XDG_CONFIG_HOME="${HOME}/.config"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}/usr/local/lib/rustlib/i386-intel-linux/lib"


[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec weston-launch
