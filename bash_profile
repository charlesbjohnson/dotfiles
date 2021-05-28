[[ -f "$HOME/.config/dotfile/init.sh" ]] && source "$HOME/.config/dotfile/init.sh"
dotfile::load "$HOME/.config/dotfile/env/init.sh"
dotfile::load "$HOME/.config/dotfile/shell/init.sh"

dotfile::load "$HOME/.profile"
dotfile::load "$HOME/.config/dotfile/bash_profile.local"

if [[ "$-" =~ i ]]; then
  dotfile::load "$HOME/.bashrc"
fi
