#!/usr/bin/env bash

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
    eval "$(dircolors "$HOME/.config/shell/$1")"
  fi
}

function shell::prompt() {
  eval "$(starship init bash)"
}

# https://github.com/sorin-ionescu/prezto/blob/master/modules/tmux/init.zsh
function shell::tmux() {
  if ! command -v "tmux" &>/dev/null; then
    return
  fi

  if [[ -n "$SSH_TTY" || -n "$TMUX" || -n "$EMACS" || -n "$VIM" ]]; then
    return
  fi

  local name="$1"

  tmux start-server
  if ! tmux has-session 2>/dev/null; then
    tmux new-session -d -s "$name"
    tmux set-option -t "$name" destroy-unattached off &>/dev/null
  fi

  exec tmux attach-session
}

function shell::cleanup() {
  unset -f shell::is_sh
  unset -f shell::is_fish
  unset -f shell::termcolor
  unset -f shell::dircolors
  unset -f shell::prompt
  unset -f shell::tmux
  unset -f shell::cleanup
}
