[[ -f ~/.profile ]] && source ~/.profile

load_if_exists "$HOME/.config/dotfiles/bash_profile.local"
load_if_exists "$HOME/.bashrc"
