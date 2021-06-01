function dotfile::shell::dircolors
    if not test -f $HOME/.dir_colors
        curl --silent --location --output $HOME/.dir_colors $argv[1]
    end

    eval (dircolors --csh $HOME/.dir_colors)
end

function dotfile::shell::gpg
    dotfile::set_env GPG_TTY (tty)
    gpg-agent --daemon 2>/dev/null
end

function dotfile::shell::prompt
    starship init fish | source
end

function dotfile::shell::ssh
    dotfile::set_env SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    dotfile::unset_env SSH_AGENT_PID
end

function dotfile::shell::terminfo
    if not test -d "$HOME/.terminfo"
        tic -x (curl --silent --location $argv[2] | gunzip | psub)
    end

    dotfile::set_env TERM $argv[1]
end

function dotfile::shell::tmux
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

    tmux start-server

    if not tmux has-session 2>/dev/null
        tmux new-session -d -s $argv[1]
        tmux set-option -t $argv[1] destroy-unattached off &>/dev/null
    end

    exec tmux attach-session
end
