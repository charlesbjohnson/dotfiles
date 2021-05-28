dotfile::set_env PATH

dotfile::append_env PATH "$HOME/.local/bin"
dotfile::append_env PATH "/usr/local/bin"
dotfile::append_env PATH "/usr/local/sbin"
dotfile::append_env PATH "/usr/bin"
dotfile::append_env PATH "/usr/sbin"
dotfile::append_env PATH "/bin"
dotfile::append_env PATH "/sbin"

dotfile::load_all "$HOME/.config/dotfile" "profile.*"

dotfile::env::gpg
dotfile::env::fzf
dotfile::env::direnv
dotfile::env::asdf
