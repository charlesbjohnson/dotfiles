# fmt=shfmt
# shellcheck shell=bash

if shopt -q login_shell; then
  dotfile::load "$HOME/.config/dotfile/shrc"
  dotfile::load_all "$HOME/.config/dotfile" "bashrc.*"

  # asdf
  source "$HOMEBREW_PREFIX/opt/asdf/libexec/asdf.sh"
fi
