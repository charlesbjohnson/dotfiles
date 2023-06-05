# fmt=shfmt
# shellcheck shell=bash

function dotfile::append_path() {
  IFS=':' read -ra paths <<<"$1"

  for path in "${paths[@]}"; do
    if [[ -z "$PATH" ]]; then
      export PATH="$path"
    elif [[ ":$PATH:" != *":$path:"* ]]; then
      export PATH="$PATH:$path"
    fi
  done
}

function dotfile::prepend_path() {
  IFS=':' read -ra paths <<<"$1"

  for ((i = ${#paths[@]} - 1; i >= 0; i--)); do
    path="${paths[i]}"

    if [[ -z "$PATH" ]]; then
      export PATH="$path"
    elif [[ ":$PATH:" != *":$path:"* ]]; then
      export PATH="$path:$PATH"
    fi
  done
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
