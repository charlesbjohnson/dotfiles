[[ -f ~/.config/dotfile/utility.sh ]] && source ~/.config/dotfile/utility.sh

load_if_exists "$HOME/.profile"

load_if_exists "$HOME/.config/dotfile/zprofile.local"
