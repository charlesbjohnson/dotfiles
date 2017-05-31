[[ -f ~/.config/dotfile/init.sh ]] && source ~/.config/dotfile/init.sh

dotfile::load_if_exists "$HOME/.profile"

dotfile::load_if_exists "$HOME/.config/dotfile/bash_profile.local"
dotfile::load_if_exists "$HOME/.bashrc"
