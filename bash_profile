[[ -f ~/.config/dotfile/init.sh ]] && source ~/.config/dotfile/init.sh

load_if_exists "$HOME/.profile"

load_if_exists "$HOME/.config/dotfile/bash_profile.local"
load_if_exists "$HOME/.bashrc"
