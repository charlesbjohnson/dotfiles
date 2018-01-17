# https://github.com/sorin-ionescu/prezto/blob/master/modules/tmux/init.zsh
function tmux::autostart() {
	if ! command -v "tmux" &>/dev/null; then
		return
	fi

	if [[ -n "$SSH_TTY" || -n "$TMUX" || -n "$EMACS" || -n "$VIM" ]]; then
		return
	fi

	local name="$1"

	tmux start-server
	if ! tmux has-session 2>/dev/null; then
		tmux new-session -d -s "$name"
		tmux set-option -t "$name" destroy-unattached off &>/dev/null
	fi

	exec tmux attach-session
}

function tmux::cleanup() {
	unset -f tmux::autostart
	unset -f tmux::cleanup
}
