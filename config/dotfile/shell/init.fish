function dotfile::shell::dircolors
    if not test -f $HOME/.dir_colors
        curl --silent --location --output $HOME/.dir_colors $argv[1]
    end

    eval "$(dircolors --csh $HOME/.dir_colors)"
end

function dotfile::shell::terminfo
    if not test -d "$HOME/.terminfo"
        tic -x -o "$HOME/.terminfo" "$(curl --silent --location $argv[1] | gunzip | psub)"
    end
end

function dotfile::shell::tmux
    if not command --search --quiet tmux
        return
    end

    if test -n "$SSH_TTY" -o -n "$TMUX" -o -n "$EMACS" -o -n "$VIM"
        return
    end

    if not test -d "$HOME/.config/tmux/plugins/tpm"
        git clone "https://github.com/tmux-plugins/tpm" "$HOME/.config/tmux/plugins/tpm"
        $HOME/.config/tmux/plugins/tpm/bin/install_plugins
    end

    if not tmux has-session 2>/dev/null
        tmux new-session -d -s $argv[1]
        tmux set-option -t $argv[1] destroy-unattached off &>/dev/null
    end

    exec tmux attach-session
end

function dotfile::shell::win::ssh
    if ! pgrep -f "[o]penssh-ssh-agent" >/dev/null
        if test -S "$SSH_AUTH_SOCK"
            rm "$SSH_AUTH_SOCK"
        end

        setsid nohup socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork >/dev/null 2>&1 & disown &
    end
end
