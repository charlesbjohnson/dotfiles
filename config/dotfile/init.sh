function dotfile::set_env() {
	export "$1=$2"
}

function dotfile::load_if_exists() {
	if [[ -f "$1" ]]; then
		source "$1"
	fi
}

function dotfile::path_prepend() {
	local args=()

	# ensure that the first argument will appear first in the PATH
	for arg in "$@"; do
		args=("$arg" "${args[@]}")
	done

	for arg in "${args[@]}"; do
		if [[ ":$PATH:" != *":$arg:"* ]]; then
			PATH="$arg${PATH:+":$PATH"}"
		fi
	done
}

function dotfile::path_append() {
	for arg in "$@"; do
		if [[ ":$PATH:" != *":$arg:"* ]]; then
			PATH="${PATH:+"$PATH:"}$arg"
		fi
	done
}

function dotfile::alias() {
	alias "$1=$2"
}
