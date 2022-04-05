# fmt: shfmt

dotfile::set_env HOSTNAME "$(hostname)"
dotfile::set_env PATH

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

dotfile::set_env FZF_DEFAULT_COMMAND "fd --type f --hidden --follow"
dotfile::set_env FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
dotfile::set_env FZF_DEFAULT_OPTS "
  --bind 'alt-j:down,alt-k:up'
  --color 'fg:#E5E9F0,bg:#3B4252,hl:#88C0D0'
  --color 'fg+:#ECEFF4,bg+:#4C566A,hl+:#88C0D0'
  --color 'gutter:#3B4252,spinner:#B48DAC'
  --color 'prompt:#BF6069,pointer:#B48DAC,marker:#A3BE8B'
  --info hidden
  --margin 0,2
  --pointer '|' --prompt '| '
"

dotfile::prepend_env PATH "$HOME/.local/bin"
dotfile::prepend_env PATH "bin"
