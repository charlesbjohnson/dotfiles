env::golang "$HOME/Projects/golang"

dotfile::path_append \
  "/usr/local/bin"   \
  "/usr/bin"         \
  "/bin"             \
  "/usr/sbin"        \
  "/sbin"

env::rbenv
env::nodenv

dotfile::path_prepend   \
  "$HOME/.local/bin"    \
  "./node_modules/.bin" \
  "$GOPATH/bin"

dotfile::load_if_exists "$HOME/.config/dotfile/profile.local"
dotfile::load_if_exists "$HOME/.config/dotfile/profile.secret"
