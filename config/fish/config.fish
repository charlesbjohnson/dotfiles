if not status --is-login
    exit
end

test -f "$HOME/.config/dotfile/init.fish" && source "$HOME/.config/dotfile/init.fish"
dotfile::load_all "$HOME/.config/dotfile" "init.fish"

dotfile::load "$HOME/.profile"

if not status --is-interactive
    exit
end

dotfile::load "$HOME/.config/dotfile/shrc"
dotfile::load "$HOME/.config/dotfile/config/fish/config.local.fish"

dotfile::load_all "$HOME/.config/dotfile" "cleanup.fish"

set -g fish_greeting
fish_user_colors
fish_user_keybindings
