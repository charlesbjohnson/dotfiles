function shell::is_sh
  false
end

function shell::is_fish
  true
end

function shell::termcolor
  if not string match --quiet "*256color*" $TERM
    set --export --global TERM $argv[1]
  end
end

function shell::dircolors
  if not test -f "$HOME/.config/shell/$argv[1]"
    return
  end

  set try_cmds "dircolors" "gdircolors"
  set cmd

  for try_cmd in $try_cmds
    if command --search --quiet $try_cmd
      set cmd $try_cmd
      break
    end
  end

  eval (eval "$cmd -c $HOME/.config/shell/$argv[1]")
end

function shell::prompt
  starship init fish | source
end

function shell::tmux
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

function shell::cleanup
  functions --erase shell::is_sh
  functions --erase shell::is_fish
  functions --erase shell::termcolor
  functions --erase shell::dircolors
  functions --erase shell::prompt
  functions --erase shell::tmux
  functions --erase shell::cleanup
end
