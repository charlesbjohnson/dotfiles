# TODO
# tmux autostart
#
export ZPLUG_HOME=/usr/local/opt/zplug
load_if_exists "$ZPLUG_HOME/init.zsh"

zplug "zsh-users/zsh-syntax-highlighting",      defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug "modules/gnu-utility",  from:prezto
zplug "modules/utility",      from:prezto
zplug "plugins/vi-mode",      from:oh-my-zsh
zplug "plugins/dotenv",       from:oh-my-zsh
zplug "plugins/fancy-ctrl-z", from:oh-my-zsh

zplug "themes/steeef", from:oh-my-zsh

zstyle ':prezto:*:*' color 'yes'

load_if_exists "$HOME/.config/dotfiles/shrc"
load_if_exists "$HOME/.config/dotfiles/zshrc.local"

zplug load
load_if_exists "$HOME/.fzf.zsh"
