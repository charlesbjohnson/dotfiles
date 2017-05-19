export ZPLUG_HOME=/usr/local/opt/zplug
[[ -f $ZPLUG_HOME/init.zsh ]] && source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-syntax-highlighting",      defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3

zplug "modules/gnu-utility",  from:prezto
zplug "modules/utility",      from:prezto
zplug "plugins/vi-mode",      from:oh-my-zsh
zplug "plugins/dotenv",       from:oh-my-zsh
zplug "plugins/fancy-ctrl-z", from:oh-my-zsh

zplug "themes/steeef", from:oh-my-zsh

zstyle ':prezto:*:*' color 'yes'

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
zplug load
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh

[[ -f ~/.shrc ]] && source ~/.shrc
