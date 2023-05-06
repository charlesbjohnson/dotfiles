if not status --is-login
    exit
end

test -f "$HOME/.config/dotfile/init.fish" && source "$HOME/.config/dotfile/init.fish"
dotfile::load_all "$HOME/.config/dotfile" "init.fish"

dotfile::load "$HOME/.profile"
dotfile::load "$HOME/.aliases"

if status --is-interactive
    dotfile::load "$HOME/.config/dotfile/shrc"
    dotfile::load_all "$HOME/.config/dotfile" "config.fish.*"

    # asdf
    source "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.fish"

    set -g fish_greeting
    fish_user_colors
    fish_user_keybindings

    dotfile::load_all "$HOME/.config/fish/completions" "*.fish"
end

dotfile::load_all "$HOME/.config/dotfile" "cleanup.fish"
