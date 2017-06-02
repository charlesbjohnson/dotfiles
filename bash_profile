[[ -f "$HOME/.config/dotfile/init.sh" ]] && source "$HOME/.config/dotfile/init.sh"
dotfile::load_if_exists "$HOME/.config/env/init.sh"
dotfile::load_if_exists "$HOME/.config/shell/init.sh"
dotfile::load_if_exists "$HOME/.config/tmux/init.sh"

dotfile::load_if_exists "$HOME/.profile"

dotfile::load_if_exists "$HOME/.config/dotfile/bash_profile.local"

if [[ "$-" =~ i ]]; then
  dotfile::load_if_exists "$HOME/.bashrc"
fi
