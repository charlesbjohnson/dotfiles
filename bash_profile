[[ -f ~/.config/dotfiles/utility.sh ]] && source ~/.config/dotfiles/utility.sh

load_if_exists "$HOME/.profile"

load_if_exists "$HOME/.config/dotfiles/bash_profile.local"
load_if_exists "$HOME/.bashrc"
