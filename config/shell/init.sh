function shell::is_sh() {
  true
}

function shell::is_fish() {
  false
}

function shell::termcolor() {
  if ! [[ "$TERM" =~ 256color ]]; then
    export TERM="$1"
  fi
}

function shell::dircolors() {
  if [[ -f "$HOME/.config/shell/$1" ]]; then
    eval "$(dircolors $HOME/.config/shell/$1)"
  fi
}

function shell::cleanup() {
  unset -f shell::is_sh
  unset -f shell::is_fish
  unset -f shell::termcolor
  unset -f shell::dircolors
  unset -f shell::cleanup
}
