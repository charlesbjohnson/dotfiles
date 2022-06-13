#!/usr/bin/env bash

function dotfile::append_path() {
  if [[ -z "$PATH" ]]; then
    export PATH="$2"
  elif [[ ":$PATH:" != *":$2:"* ]]; then
    export PATH="$PATH:$2"
  fi
}

function dotfile::prepend_path() {
  if [[ -z "$PATH" ]]; then
    export PATH="$2"
  elif [[ ":$PATH:" != *":$2:"* ]]; then
    export PATH="$2:$PATH"
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

function dotfile::alias() {
  alias "$1=$2"
}
