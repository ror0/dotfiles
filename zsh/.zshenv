export XDG_CONFIG_HOME="$HOME/.config"
export PATH="$PATH:$HOME/bin:$HOME/.gem/ruby/2.4.0/bin"

export TERMINAL="alacritty"
export VISUAL="vim"
export EDITOR=$VISUAL
if [[ "$USER" != "root" ]]; then
	export BROWSER="chromium"
	export BACKUP="$HOME/backup/dotfiles"
	if [ -f "/bin/rustc" ]; then
		export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
	fi
	export GOPATH="$HOME/files/gospace"
	export PATH="$PATH:$GOPATH/bin"
fi
