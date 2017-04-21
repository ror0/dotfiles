# ZSH Modules
autoload -U compinit promptinit colors
autoload -Uz vcs_info
colors
compinit
promptinit
autoload zmv

# Dircolors
if [[ -a "$HOME/.dircolors" ]]; then
	eval "$(dircolors $HOME/.dircolors)"
fi

# Options
setopt multios
setopt correct
setopt no_beep
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt prompt_subst

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
alias tmux="tmux -2"
alias ":q"='echo "FOOL! You are not in VIM!"'
alias "q"='echo "FOOL! You are not in VIM!"'

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

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Other 
bindkey -v

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
