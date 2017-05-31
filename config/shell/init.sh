function shell::termcolor() {
  if ! [[ "$TERM" =~ 256color ]]; then
    dotfile::set_env "TERM" "$1"
  fi
}

function shell::dircolors() {
  if [[ -f "$1" ]]; then
    eval "$(dircolors $1)"
  fi
}
