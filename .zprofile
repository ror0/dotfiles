export PANEL_FIFO="/tmp/panel-fifo"
export BSPWM_SOCKET="/tmp/bspwm-socket"
export XDG_CONFIG_HOME="${HOME}/.config"
export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}/usr/local/lib/rustlib/i386-intel-linux/lib"
export RUST_SRC_PATH="/usr/src/rust/src"
export GOPATH="${HOME}/files/go"
export PATH="${PATH}:${HOME}/bin:${GOPATH}/bin"


[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
#[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec weston-launch
