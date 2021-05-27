if not status --is-login
    exit
end

test -f "$HOME/.config/dotfile/init.fish" && source "$HOME/.config/dotfile/init.fish"
dotfile::load "$HOME/.config/env/init.fish"
dotfile::load "$HOME/.config/shell/init.fish"
dotfile::load "$HOME/.config/tmux/init.fish"

dotfile::load "$HOME/.profile"

if not status --is-interactive
    exit
end

set -g fish_greeting
fish_user_colors
fish_user_keybindings

dotfile::load "$HOME/.config/dotfile/config/fish/config.local.fish"
dotfile::load "$HOME/.config/dotfile/shrc"
