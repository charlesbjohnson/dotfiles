dotfile::path_reset

dotfile::path_append \
  "/usr/local/bin"   \
  "/usr/bin"         \
  "/bin"             \
  "/usr/local/sbin"  \
  "/usr/sbin"        \
  "/sbin"

env::gpg
env::fzf

dotfile::load_all "$HOME/.config/dotfile" "profile.*"
dotfile::path_prepend "$HOME/.local/bin"
