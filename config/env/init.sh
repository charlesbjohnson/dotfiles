function env::rbenv() {
  ! [[ "$PATH" =~ rbenv ]] && eval "$(rbenv init -)"
}

function env::nodenv() {
  ! [[ "$PATH" =~ nodenv ]] && eval "$(nodenv init -)"
}

function env:gnu() {
  dotfile::load_if_exists "$HOME/.config/env/gnu.sh"
}
