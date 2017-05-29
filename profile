# prepend to PATH, such that first argument is first to appear in PATH
function path_prepend() {
  local args=( "$@" )
  local rev=()

  for arg in "${args[@]}"; do
    rev=( "$arg" "${rev[@]}" )
  done

  for arg in "${rev[@]}"; do
    if [[ ":$PATH:" != *":$arg:"* ]]; then
      PATH="$arg${PATH:+":$PATH"}"
    fi
  done
}

# append to PATH, such that last argument is last to appear in PATH
function path_append() {
  for arg in "$@"; do
    if [[ ":$PATH:" != *":$arg:"* ]]; then
      PATH="${PATH:+"$PATH:"}$arg"
    fi
  done
}

function path_contains() {
  echo "$PATH" | grep "$1" &>/dev/null
}

function command_exists() {
  command -v "$1" &>/dev/null
}

function load_if_exists() {
  [[ -f "$1" ]] && source "$1"
}

export GOPATH=$HOME/Projects/golang

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
