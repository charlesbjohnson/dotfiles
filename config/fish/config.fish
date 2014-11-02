# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme agnoster

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins bak extract gi rbenv nodenv vi-mode

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
source $fish_path/oh-my-fish.fish

source ~/.fish_env

set PATH $HOME/.bin $PATH # User scripts/executables

set -x EDITOR "vim"
set -x BROWSER "chromium"

eval (dircolors ~/.config/dircolors-solarized/dircolors.256dark | head -n 1 | sed 's/\(LS_COLORS\)=/set -x \1 /g')

[ -f ~/.aliases_fish ]; and source ~/.aliases_fish

# always use tmux
if [ -z "$TMUX" ]
  set ID (tmux ls | grep -vm1 attached | cut -d: -f1)
  if [ -z "$ID" ]
    exec tmux new-session
  else
    exec tmux attach-session -t "$ID"
  end
end
