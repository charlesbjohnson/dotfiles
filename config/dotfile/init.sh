# fmt=shfmt
# shellcheck shell=bash

function dotfile::append_path() {
  if [[ -z "$PATH" ]]; then
    export PATH="$1"
  elif [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$PATH:$1"
  fi
}

function dotfile::prepend_path() {
  if [[ -z "$PATH" ]]; then
    export PATH="$1"
  elif [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$1:$PATH"
  fi
}

function dotfile::load() {
  if [[ -f "$1" ]]; then
    source "$1"
  fi
}

function dotfile::load_all() {
  while IFS= read -r -d '' file; do
    source "$file"
  done < <(find -L "$1" -name "$2" -type f -print0)
}
