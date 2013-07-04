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
alias ll='ls -lah'
alias dir='dir --color=auto'
alias grep='grep --color=auto'
alias pacman='sudo pacmatic'
alias svi='sudo vim'
alias vi='vim'
alias su='su -'
alias pdf='zathura'
alias img='sxiv'
alias systemctl='sudo systemctl'
alias netcfg='sudo netcfg'
#Done

# Prompt
if [[ "$USER" == "root" ]]; then
        PROMPT="%{$fg[green]%} >  %{$reset_color%}"
        RPROMPT="%{$fg[green]%}%~%{$reset_color%}"
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

export PERL_LOCAL_LIB_ROOT="$PERL_LOCAL_LIB_ROOT:/home/rohan/perl5";
export PERL_MB_OPT="--install_base /home/rohan/perl5";
export PERL_MM_OPT="INSTALL_BASE=/home/rohan/perl5";
export PERL5LIB="/home/rohan/perl5/lib/perl5:$PERL5LIB";
export PATH="/home/rohan/perl5/bin:$PATH";
