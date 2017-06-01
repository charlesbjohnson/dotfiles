[[ -f "$HOME/.config/dotfile/init.sh" ]] && source "$HOME/.config/dotfile/init.sh"
dotfile::load_if_exists "$HOME/.config/env/init.sh"
dotfile::load_if_exists "$HOME/.config/shell/init.sh"

dotfile::load_if_exists "$HOME/.profile"

dotfile::load_if_exists "$HOME/.config/dotfile/zprofile.local"
