# https://github.com/sorin-ionescu/prezto/blob/master/modules/tmux/init.zsh

! command_exists "tmux" && return
[[ -n "$SSH_TTY" || -n "$TMUX" || -n "$EMACS" || -n "$VIM"  ]] && return

tmux_session_name="default"

tmux start-server
if ! tmux has-session 2>/dev/null; then
  tmux new-session -d -s "$tmux_session_name"
  tmux set-option -t "$tmux_session_name" destroy-unattached off &>/dev/null
fi

unset tmux_session_name

exec tmux attach-session
