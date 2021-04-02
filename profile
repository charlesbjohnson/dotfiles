dotfile::set_env PATH

 dotfile::append_env PATH "/usr/local/bin"
 dotfile::append_env PATH "/usr/bin"
 dotfile::append_env PATH "/bin"
 dotfile::append_env PATH "/usr/local/sbin"
 dotfile::append_env PATH "/usr/sbin"
 dotfile::append_env PATH "/sbin"

env::gpg
env::fzf
env::asdf
env::direnv

dotfile::load_all "$HOME/.config/dotfile" "profile.*"
dotfile::prepend_env PATH "$HOME/.local/bin"
