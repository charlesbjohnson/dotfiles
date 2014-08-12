source ~/.commonenv
source ~/.commonshrc

alias ls='ls --color=auto'

# use rbenv for ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# use nvm for nodejs
source ~/.nvm/nvm.sh
nvm use 0.11 > /dev/null
