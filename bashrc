source ~/.common_env

# always use tmux
if [[ "$SESSION_TYPE" != remote/ssh && -z "$TMUX" ]]; then
  ID="`tmux ls 2>/dev/null | grep -vm1 attached | cut -d: -f1`"
  if [[ -z "$ID" ]]; then
    exec tmux new-session
  else
    exec tmux attach-session -t "$ID"
  fi
fi

source ~/.common_shrc
alias ls='ls --color=auto'

# use rbenv for ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
