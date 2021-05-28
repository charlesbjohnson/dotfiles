#!/usr/bin/env bash

function shell::dircolors() {
  if ! [[ -f "$HOME/.config/shell/$1" ]]; then
    cd "$HOME/.config/shell" && git clone "$2" && cd -
  fi

  eval "$(dircolors "$HOME/.config/shell/$1")"
}

function shell::prompt() {
  eval "$(starship init bash)"
}

function shell::ssh() {
  if ! pgrep --full "ssh-agent" &>/dev/null; then
    eval "$(ssh-agent -c)" &>/dev/null
    return
  fi

  export SSH_AGENT_PID="$(pgrep --full "ssh-agent" | head --lines 1)"
  export SSH_AUTH_SOCK="$(find /tmp/ssh-* -name "agent.*" | head --lines 1)"
}

function shell::terminfo() {
  if ! [[ -d "$HOME/.terminfo" ]]; then
    tic -x <(curl --silent --location "$2" | gunzip)
  fi

  export TERM="$1"
}

# https://github.com/sorin-ionescu/prezto/blob/master/modules/tmux/init.zsh
function shell::tmux() {
  if ! command -v "tmux" &>/dev/null; then
    return
  fi

  if [[ -n "$SSH_TTY" || -n "$TMUX" || -n "$EMACS" || -n "$VIM" ]]; then
    return
  fi

  if ! [[ -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
    $HOME/.tmux/plugins/tpm/bin/install_plugins
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
  unset -f shell::dircolors
  unset -f shell::prompt
  unset -f shell::ssh
  unset -f shell::terminfo
  unset -f shell::tmux
  unset -f shell::cleanup
}
