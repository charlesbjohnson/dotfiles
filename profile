# fmt=shfmt

export HOSTNAME="$(hostname)"

export PATH_OLD="$PATH"
export PATH=

dotfile::append_path "/usr/local/bin"
dotfile::append_path "/usr/local/sbin"
dotfile::append_path "/usr/bin"
dotfile::append_path "/usr/sbin"
dotfile::append_path "/bin"
dotfile::append_path "/sbin"

dotfile::load "$HOME/.config/dotfile/profile.homebrew"
dotfile::env::shell

dotfile::load_all "$HOME/.config/dotfile" "profile.*"

dotfile::prepend_path "$HOME/.local/bin"
dotfile::prepend_path "bin"

dotfile::append_path "$PATH_OLD"
