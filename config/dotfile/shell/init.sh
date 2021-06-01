#!/usr/bin/env bash

function dotfile::shell::dircolors() {
  if ! [[ -f "$HOME/.dir_colors" ]]; then
    curl --silent --location --output "$HOME/.dir_colors" "$1"
  fi

  eval "$(dircolors --sh "$HOME/.dir_colors")"
}

function dotfile::shell::prompt() {
  eval "$(starship init bash)"
}

function dotfile::shell::ssh() {
  if ! pgrep --full "ssh-agent" &>/dev/null; then
    eval "$(ssh-agent -c)" &>/dev/null
    return
  fi

  dotfile::set_env SSH_AGENT_PID "$(pgrep --full "ssh-agent" | head --lines 1)"
  dotfile::set_env SSH_AUTH_SOCK "$(find /tmp/ssh-* -name "agent.*" | head --lines 1)"
}

function dotfile::shell::terminfo() {
  if ! [[ -d "$HOME/.terminfo" ]]; then
    tic -x <(curl --silent --location "$2" | gunzip)
  fi

  dotfile::set_env TERM "$1"
}

# https://github.com/sorin-ionescu/prezto/blob/master/modules/tmux/init.zsh
function dotfile::shell::tmux() {
  if ! command -v "tmux" &>/dev/null; then
    return
  fi

  if [[ -n "$SSH_TTY" || -n "$TMUX" || -n "$EMACS" || -n "$VIM" ]]; then
    return
  fi

  if ! [[ -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
    "$HOME/.tmux/plugins/tpm/bin/install_plugins"
  fi

  tmux start-server

  if ! tmux has-session 2>/dev/null; then
    tmux new-session -d -s "$1"
    tmux set-option -t "$1" destroy-unattached off &>/dev/null
  fi

  exec tmux attach-session
}
