dotfile::set_env "ZPLUG_HOME" "/usr/local/opt/zplug"
dotfile::load_if_exists "$ZPLUG_HOME/init.zsh"

zplug "zsh-users/zsh-syntax-highlighting",      defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug "plugins/vi-mode",      from:oh-my-zsh
zplug "plugins/fancy-ctrl-z", from:oh-my-zsh

zplug "themes/steeef", from:oh-my-zsh

# zsh-users/zsh-history-substring-search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

dotfile::load_if_exists "$HOME/.config/dotfile/shrc"
dotfile::load_if_exists "$HOME/.config/dotfile/zshrc.local"

zplug load

dotfile::load_if_exists "$HOME/.fzf.zsh"
