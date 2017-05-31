set_env "PATH" ""
set_env "GOPATH" "$HOME/Projects/golang"

path_append \
  "/usr/local/bin" \
  "/usr/bin"       \
  "/bin"           \
  "/usr/sbin"      \
  "/sbin"

! [[ "$PATH" =~ rbenv ]] && eval "$(rbenv init -)"
! [[ "$PATH" =~ nodenv ]] && eval "$(nodenv init -)"

path_prepend \
  "$HOME/.local/bin"    \
  "./node_modules/.bin" \
  "$GOPATH/bin"

load_if_exists "$HOME/.config/dotfile/profile.local"
load_if_exists "$HOME/.config/dotfile/profile.secret"
