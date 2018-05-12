env::golang "$HOME/Projects/golang"

dotfile::path_append \
  "/usr/local/bin"   \
  "/usr/bin"         \
  "/bin"             \
  "/usr/local/sbin"  \
  "/usr/sbin"        \
  "/sbin"

env::rbenv
env::nodenv

dotfile::path_prepend \
  "$HOME/.local/bin"  \
  "$GOPATH/bin"

dotfile::load_all "$HOME/.config/dotfile" "profile.*"
