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
        cd "$HOME/.config/shell" && git clone $argv[2] && cd -
    end

    set try_cmds dircolors gdircolors
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

function shell::ssh
    if ! pgrep --full "ssh-agent" &>/dev/null
        eval (ssh-agent -c) &>/dev/null
        return
    end

    set --export --global SSH_AGENT_PID (pgrep --full "ssh-agent" | head --lines 1)
    set --export --global SSH_AUTH_SOCK (find /tmp/ssh-* -name "agent.*" | head --lines 1)
end

function shell::tmux
    if not command --search --quiet tmux
        return
    end

    if test -n "$SSH_TTY" -o -n "$TMUX" -o -n "$EMACS" -o -n "$VIM"
        return
    end

    if not test -d "$HOME/.tmux/plugins/tpm"
        git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
        $HOME/.tmux/plugins/tpm/bin/install_plugins
    end

    set name $argv[1]
    tmux start-server

    if not tmux has-session 2>/dev/null
        tmux new-session -d -s $name
        tmux set-option -t $name destroy-unattached off &>/dev/null
    end

    exec tmux attach-session
end

function shell::cleanup
    functions --erase shell::is_sh
    functions --erase shell::is_fish
    functions --erase shell::termcolor
    functions --erase shell::dircolors
    functions --erase shell::prompt
    functions --erase shell::ssh
    functions --erase shell::tmux
    functions --erase shell::cleanup
end
