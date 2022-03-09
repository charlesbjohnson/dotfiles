#!/usr/bin/env bash

shopt -s expand_aliases

[[ -f "$HOME/.config/dotfile/init.sh" ]] && source "$HOME/.config/dotfile/init.sh"
dotfile::load_all "$HOME/.config/dotfile" "init.sh"

dotfile::load "$HOME/.profile"
dotfile::load "$HOME/.config/dotfile/bash_profile.local"

dotfile::load "$HOME/.aliases"

if [[ "$-" =~ i ]]; then
  dotfile::load "$HOME/.bashrc"
fi

dotfile::load_all "$HOME/.config/dotfile" "cleanup.sh"
