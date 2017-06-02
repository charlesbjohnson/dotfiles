if not status --is-login
  exit
end

test -f "$HOME/.config/dotfile/init.fish"; and source "$HOME/.config/dotfile/init.fish"
dotfile::load_if_exists "$HOME/.config/env/init.fish"
dotfile::load_if_exists "$HOME/.config/shell/init.fish"
dotfile::load_if_exists "$HOME/.config/tmux/init.fish"

dotfile::load_if_exists "$HOME/.profile"

if not status --is-interactive
  exit
end

dotfile::load_if_exists "$HOME/.config/dotfile/config.local.fish"
dotfile::load_if_exists "$HOME/.config/dotfile/shrc"
