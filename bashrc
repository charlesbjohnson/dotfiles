# always use tmux
if [[ "$SESSION_TYPE" != remote/ssh && -z "$TMUX" ]]; then
  ID=$(tmux ls 2>/dev/null | grep -vm1 attached | cut -d: -f1)
  if [[ -z "$ID" ]]; then
    exec tmux new-session
  else
    exec tmux attach-session -t "$ID"
  fi
fi

[[ -f ~/.shrc ]] && source ~/.shrc
[[ -f ~/.bashrc.local ]] && source ~/.bashrc.local

[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash
