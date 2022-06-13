#!/usr/bin/env bash

function dotfile::append_env() {
  if eval "[[ -z \"\$$1\" ]]"; then
    dotfile::set_env "$1" "$2"
  elif eval "[[ \":\$$1:\" != *\":$2:\"* ]]"; then
    eval "$1=\"\$$1:$2\""
  fi
}

function dotfile::prepend_env() {
  if eval "[[ -z \"\$$1\" ]]"; then
    dotfile::set_env "$1" "$2"
  elif eval "[[ \":\$$1:\" != *\":$2:\"* ]]"; then
    eval "$1=\"$2:\$$1\""
  fi
}

function dotfile::set_env() {
  export "$1=$2"
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

function dotfile::alias() {
  alias "$1=$2"
}
