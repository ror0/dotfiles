[ -z "$BACKUP" ] && { echo "Please set the BACKUP env variable"; exit 1; }
[ -z "$XDG_CONFIG_HOME" ] && { export XDG_CONFIG_HOME=$HOME/.config; }

RSYNC_COMMAND="rsync --update --recursive --copy-links --perms --owner --group --devices --specials --delete --times --verbose --progress --human-readable --ignore-missing-args"

# Backup Vim settings
eval "$RSYNC_COMMAND --exclude=autoload --exclude=plugged --exclude=.netrwhist --exclude=swap $HOME/.vim $HOME/.vimrc $BACKUP/vim"

# Backup Neovim settings
eval "$RSYNC_COMMAND --exclude=autoload --exclude=plugged --exclude=.netrwhist --exclude=swap $XDG_CONFIG_HOME/nvim $BACKUP"

# Backup X.org settings
eval "$RSYNC_COMMAND $HOME/.Xresources $HOME/.xinitrc $HOME/.dircolors $BACKUP/xorg"

# Backup Zsh settings
eval "$RSYNC_COMMAND $HOME/.zshrc $HOME/.zshenv $HOME/.zprofile $BACKUP/zsh"

# Backup Git settings
eval "$RSYNC_COMMAND $HOME/.gitignore $HOME/.gitconfig $BACKUP/git"

#Backup bspwm settings
eval "$RSYNC_COMMAND $XDG_CONFIG_HOME/bspwm $BACKUP"

#Backup sxhkd settings
eval "$RSYNC_COMMAND $XDG_CONFIG_HOME/sxhkd $BACKUP"

#Backup Polybar settings
eval "$RSYNC_COMMAND $XDG_CONFIG_HOME/polybar $BACKUP"

#Backup Rofi settings
eval "$RSYNC_COMMAND $XDG_CONFIG_HOME/rofi $BACKUP"

#Backup Termite settings
eval "$RSYNC_COMMAND $XDG_CONFIG_HOME/termite $BACKUP"

#Backup tmux settings
eval "$RSYNC_COMMAND $HOME/.tmux.conf $BACKUP/tmux"

# Backup scripts
eval "$RSYNC_COMMAND $HOME/bin $BACKUP"

# Backup gtk.css settings
eval "$RSYNC_COMMAND $XDG_CONFIG_HOME/gtk-3.0 $BACKUP"

# Backup pics
eval "$RSYNC_COMMAND $HOME/pics $BACKUP"

# Backup pics
eval "$RSYNC_COMMAND $XDG_CONFIG_HOME/compton $BACKUP"

# Commit and push backup
cd $HOME/backup/dotfiles
git add -A
git commit -m "$(date)"
git push
