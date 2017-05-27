if [[ "$SESSION_TYPE" != remote/ssh && -z "$TMUX" ]]; then
  ID=$(tmux ls 2>/dev/null | grep -vm1 attached | cut -d: -f1)
  if [[ -z "$ID" ]]; then
    exec tmux new-session
  else
    exec tmux attach-session -t "$ID"
  fi
fi

load_if_exists "$HOME/.config/dotfiles/shrc"
load_if_exists "$HOME/.config/dotfiles/bashrc.local"

load_if_exists "$HOME/.fzf.bash"
