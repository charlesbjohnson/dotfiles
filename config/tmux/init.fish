function tmux::autostart
  if not command --search --quiet "tmux"
    return
  end

  if test -n "$SSH_TTY" -o -n "$TMUX" -o -n "$EMACS" -o -n "$VIM"
    return
  end

  set name $argv[1]

  tmux start-server
  if not tmux has-session ^ /dev/null
    tmux new-session -d -s $name
    tmux set-option -t $name destroy-unattached off > /dev/null ^ /dev/null
  end

  exec tmux attach-session
end
