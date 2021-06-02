if not status --is-login
    exit
end

test -f "$HOME/.config/dotfile/init.fish" && source "$HOME/.config/dotfile/init.fish"
dotfile::load_all "$HOME/.config/dotfile" "init.fish"

dotfile::load "$HOME/.profile"
dotfile::load "$HOME/.aliases"

if status --is-interactive
    dotfile::load "$HOME/.config/dotfile/shrc"
    dotfile::load "$HOME/.config/dotfile/config/fish/config.local.fish"

    set -g fish_greeting
    fish_user_colors
    fish_user_keybindings
end

dotfile::load_all "$HOME/.config/dotfile" "cleanup.fish"
