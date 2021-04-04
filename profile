dotfile::set_env PATH
dotfile::set_env USER_PATH

dotfile::append_env PATH "$HOME/.local/bin"
dotfile::append_env PATH "/usr/local/bin"
dotfile::append_env PATH "/usr/local/sbin"
dotfile::append_env PATH "/usr/bin"
dotfile::append_env PATH "/usr/sbin"
dotfile::append_env PATH "/bin"
dotfile::append_env PATH "/sbin"

dotfile::load_all "$HOME/.config/dotfile" "profile.*"
dotfile::prepend_env PATH "$USER_PATH"
dotfile::unset_env USER_PATH

env::gpg
env::fzf
env::direnv
env::asdf
