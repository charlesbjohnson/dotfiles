function shell::termcolor
  if not string match --quiet "256color" $TERM
    set --export --global TERM $argv[1]
  end
end

function shell::color
  if test -f "$HOME/.config/shell/$argv[1]"
    eval sh "$HOME/.config/shell/$argv[1]"
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

  bass (eval $cmd "$HOME/.config/shell/$argv[1]")
end

function shell::cleanup
  functions --erase shell::termcolor
  functions --erase shell::color
  functions --erase shell::dircolors
  functions --erase shell::cleanup
end
