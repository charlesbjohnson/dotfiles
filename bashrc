#!/usr/bin/env bash

if shopt -q login_shell; then
  dotfile::load "$HOME/.config/dotfile/shrc"
  dotfile::load "$HOME/.config/dotfile/bashrc.local"
fi
