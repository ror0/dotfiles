# ZSH Modules
autoload -U compinit promptinit colors
colors
compinit
promptinit
# Done

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

export EDITOR="vim"
export BROWSER="dwb"
export PATH="${PATH}:${HOME}/bin"
# Done

# Aliases
alias ls='ls --color=auto'
alias la='ls -a'
alias ll='ls -la'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias pacman='sudo pacmatic'
alias svi='sudo vi'
alias su='su -'
alias pdf='zathura'
alias img='sxiv'
alias systemctl='sudo systemctl'
#Done

# Prompt
if [[ "$USER" == "root" ]]; then
        PROMPT="%{$fg[red]%} >  %{$reset_color%}"
        RPROMPT="%{$fg[red]%}%~%{$reset_color%}"
else
        PROMPT="%{$fg[blue]%} >  %{$reset_color%}"
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
zstyle ':completion:*' list-colors 'reply=( "=(#b)(*$VAR)(?)*=00=$color[green]=$color[bg-green]" )'
zstyle ':completion:*:*:*:*:hosts' list-colors '=*=30;41'
zstyle ':completion:*:*:*:*:users' list-colors '=*=$color[green]=$color[red]'
zstyle ':completion:*' menu select
