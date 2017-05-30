set_env "PATH" ""
set_env "GOPATH" "$HOME/Projects/golang"

path_append \
  "/usr/local/bin" \
  "/usr/bin"       \
  "/bin"           \
  "/usr/sbin"      \
  "/sbin"

! path_contains "rbenv" && eval "$(rbenv init -)"
! path_contains "nodenv" && eval "$(nodenv init -)"

path_prepend \
  "$HOME/.local/bin"    \
  "./node_modules/.bin" \
  "$GOPATH/bin"

load_if_exists "$HOME/.config/dotfiles/profile.local"
load_if_exists "$HOME/.config/dotfiles/profile.secret"
