# fmt: shfmt

export HOSTNAME="$(hostname)"

export PATH_OLD="$PATH"
export PATH=

dotfile::append_path "/usr/local/bin"
dotfile::append_path "/usr/local/sbin"
dotfile::append_path "/usr/bin"
dotfile::append_path "/usr/sbin"
dotfile::append_path "/bin"
dotfile::append_path "/sbin"

dotfile::load "$HOME/.config/dotfile/profile.homebrew"
dotfile::env::shell

dotfile::load_all "$HOME/.config/dotfile" "profile.*"

# fzf
source "$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.$(basename "$SHELL")"

export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="
  --bind 'ctrl-h:unbind(ctrl-h),ctrl-j:unbind(ctrl-j),ctrl-k:unbind(ctrl-k),ctrl-l:unbind(ctrl-l)'
  --bind 'alt-h:beginning-of-line,alt-l:end-of-line'
  --bind 'alt-j:down,alt-k:up,ctrl-alt-j:half-page-down,ctrl-alt-k:half-page-up'
  --bind 'ctrl-f:preview-page-down,ctrl-b:preview-page-up'
  --color 'fg:white,bg:-1,hl:cyan'
  --color 'fg+:bright-white,bg+:bright-black,hl+:bright-cyan'
  --color 'gutter:-1,spinner:magenta'
  --color 'prompt:red,pointer:magenta,marker:green'
  --border
  --reverse
"

dotfile::prepend_path "$HOME/.local/bin"
dotfile::prepend_path "bin"
