# source prezto
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

source ~/.common_shrc
source ~/.zshrc.local

for function in ~/.zsh/functions/*; do
  source $function
done
