pathprepend() {
  for ((i=$#; i > 0; i--)); do
    ARG=${!i}
    if [[ ":$PATH:" != *":$ARG:"* ]]; then
      PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}

pathappend() {
  for ARG in "$@"; do
    if [[ ":$PATH:" != *":$ARG:"* ]]; then
      PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}

export GOPATH=$HOME/Projects/golang

eval "$(rbenv init -)"
eval "$(nodenv init -)"
pathprepend "$HOME/.local/bin" "./node_modules/.bin" "$GOPATH/bin"

[[ -f ~/.config/dotfiles/profile.local ]] && source ~/.config/dotfiles/profile.local
[[ -f ~/.config/dotfiles/profile.secret ]] && source ~/.config/dotfiles/profile.secret
