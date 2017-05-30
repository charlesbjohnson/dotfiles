function set_env() {
  unset "$1"
  export "$1=$2"
}

function load_if_exists() {
  [[ -f "$1" ]] && source "$1"
}

function path_prepend() {
  local args=( "$@" )
  local rev=()

  # ensure that the first argument will appear first in the PATH
  for arg in "${args[@]}"; do
    rev=( "$arg" "${rev[@]}" )
  done

  for arg in "${rev[@]}"; do
    if [[ ":$PATH:" != *":$arg:"* ]]; then
      PATH="$arg${PATH:+":$PATH"}"
    fi
  done
}

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
