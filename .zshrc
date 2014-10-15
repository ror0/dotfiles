# ZSH Modules
autoload -U compinit promptinit colors
autoload -Uz vcs_info
colors
compinit
promptinit
autoload zmv
# Done

# Dircolors
if [[ -a "$HOME/.dircolors" ]]; then
	eval "$(dircolors -b ~/.dircolors)"
fi

# Options
setopt MULTIOS
setopt CORRECT
#setopt GLOB_COMPLETE
setopt NO_BEEP
#setopt NO_CASE_GLOB
#setopt EXTENDED_GLOB
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt PROMPT_SUBST

export EDITOR="vim"
export BROWSER="firefox"
export LD_LIBRARY_PATH="/usr/local/lib"
export TERM="xterm-256color"
[ -n "$TMUX" ] && export TERM="screen-256color"
# Done

# Aliases
alias ls='ls --group-directories-first --color=auto -X'
alias la='ls --group-directories-first --color=auto -Xa'
alias ll='ls --group-directories-first --color=auto -Xlah'
alias dir='dir --color=auto'
alias grep='grep -P --color=auto'
alias pacman='sudo pacman'
alias svi='sudo vim'
alias su='su -'
alias pdf='zathura'
alias img='mirage'
alias systemctl='sudo systemctl'
alias netctl='sudo netctl'
alias netctl-auto='sudo netctl-auto'
alias reset='reset -Q'
alias tmux='tmux -2'
alias ":q"='echo "FOOL! You are not in VIM!"'
alias "q"='echo "FOOL! You are not in VIM!"'
#Done

# Prompt
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
	vcs_info
	if [ -n "$vcs_info_msg_0_" ]; then
		echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
	fi
}

if [[ "$USER" == "root" ]]; then
	PROMPT="%{$fg[green]%} >  %{$reset_color%}"
	RPROMPT="%{$fg[green]%}%~%{$reset_color%}"
else
	PROMPT="%{$fg[blue]%} >  %{$reset_color%}"
	RPROMPT="%{$fg[blue]%}%~$(vcs_info_wrapper)%{$reset_color%}"
fi

# Done

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# Done

# Other 
bindkey -v

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
#zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
#zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'
zstyle ':completion:*' menu select

export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:${HOME}/perl5";
export PERL_MB_OPT="--install_base ${HOME}/perl5";
export PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5";
export PERL5LIB="${HOME}/perl5/lib/perl5:$PERL5LIB";
export PATH="${HOME}/perl5/bin:$PATH";
export PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH";
