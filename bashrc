source ~/.common_env
source ~/.common_shrc

alias ls='ls --color=auto'

# use rbenv for ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
