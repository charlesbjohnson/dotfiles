path_prepend() {
  for ((i=$#; i > 0; i--)); do
    ARG=${!i}
    if [[ ":$PATH:" != *":$ARG:"* ]]; then
      PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}

path_append() {
  for ARG in "$@"; do
    if [[ ":$PATH:" != *":$ARG:"* ]]; then
      PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}

command_exists() {
  command -v "$1" &>/dev/null
}

load_if_exists() {
  [[ -f "$1" ]] && source "$1"
}

export GOPATH=$HOME/Projects/golang

eval "$(rbenv init -)"
eval "$(nodenv init -)"
path_prepend "$HOME/.local/bin" "./node_modules/.bin" "$GOPATH/bin"

load_if_exists "$HOME/.config/dotfiles/profile.local"
load_if_exists "$HOME/.config/dotfiles/profile.secret"
