# fmt: shfmt

export HOSTNAME="$(hostname)"
export PATH

dotfile::append_env PATH "/usr/bin"
dotfile::append_env PATH "/usr/sbin"
dotfile::append_env PATH "/bin"
dotfile::append_env PATH "/sbin"

dotfile::load "$HOME/.config/dotfile/profile.homebrew"
dotfile::env::shell

dotfile::load_all "$HOME/.config/dotfile" "profile.*"
dotfile::env::asdf

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

dotfile::prepend_env PATH "$HOME/.local/bin"
dotfile::prepend_env PATH "bin"
