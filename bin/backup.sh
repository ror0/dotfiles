[ -z "$BACKUP" ] && { echo "Please set the BACKUP env variable"; exit 1; }

RSYNC_COMMAND="rsync --update --recursive --copy-links --perms --owner --group --devices --specials --delete --times --verbose --progress --human-readable"

# Backup Vim settings
eval "$RSYNC_COMMAND --exclude=autoload --exclude=plugged --exclude=.netrwhist $HOME/.vim $HOME/.vimrc $BACKUP/vim"

# Backup Neovim settings
eval "$RSYNC_COMMAND --exclude=autoload --exclude=plugged --exclude=.netrwhist $XDG_CONFIG_HOME/nvim $BACKUP"

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

# Backup scripts
eval "$RSYNC_COMMAND $HOME/bin $BACKUP"
