tap "homebrew/bundle"
tap "homebrew/core"

brew "asdf"
brew "bash"
brew "bat"
brew "code-minimap"
brew "curl"
brew "direnv"
brew "exa"
brew "fd"
brew "fish"
brew "fzf"
brew "git"
brew "git-delta"
brew "gnupg"
brew "jq"
brew "just"
brew "neovim", args: ["HEAD"]
brew "rargs"
brew "rcm"
brew "ripgrep"
brew "sd"
brew "shellcheck"
brew "shfmt"
brew "starship"
brew "tmux"
brew "vim"
brew "watchexec"
brew "yamllint"

Dir.glob(File.join(File.expand_path("~/.config/dotfile"), "Brewfile.*")) do |path|
  instance_eval(File.read(path))
end
