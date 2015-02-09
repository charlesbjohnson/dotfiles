# source prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

[[ -f ~/.shrc ]] && source ~/.shrc
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

for function in ~/.zsh/functions/*; do
  [[ -f "$function" ]] && source "$function"
done
