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
  for file in $(find -L "$1" -name "$2" -type f); do
    source "$file"
  done
}
