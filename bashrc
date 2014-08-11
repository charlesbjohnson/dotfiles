# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

source ~/.commonenv
source ~/.commonshrc

# use rbenv for ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# use nvm for nodejs
source ~/.nvm/nvm.sh
nvm use 0.11 > /dev/null
