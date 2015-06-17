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
setopt multios
setopt correct
#setopt GLOB_COMPLETE
setopt no_beep
#setopt NO_CASE_GLOB
#setopt EXTENDED_GLOB
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt prompt_subst

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
zstyle ':vcs_info:*' stagedstr '*'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}(% %F{4}%r% %F{5})% %F{3}-% %F{5}[% %F{2}%b% %F{3}|% $F{1}%a% %F{5}]% %F{3}%u% %F{2}%c% %f'
zstyle ':vcs_info:*' formats '%F{5}(% %F{4}%r% %F{5})% %F{3}-% %F{5}[% %F{2}%b% %F{5}]% %F{3}%u% %F{2}%c% %f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:*' enable git
+vi-git-untracked() {
	if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
		hook_com[unstaged]+='%F{1}*%f'
	fi
}

precmd () { vcs_info }

if [[ "$USER" == "root" ]]; then
	PROMPT='${vcs_info_msg_0_}'
	PROMPT+="%{$fg[green]%} >  %{$reset_color%}"
	RPROMPT="%{$fg[green]%}%~%{$reset_color%}"
else
	PROMPT='${vcs_info_msg_0_}'
	PROMPT+="%{$fg[blue]%} >  %{$reset_color%}"
	RPROMPT="%{$fg[blue]%}%~%{$reset_color%}"
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
