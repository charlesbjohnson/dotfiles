tap "homebrew/bundle"
tap "homebrew/core"

brew "asdf"
brew "bash"
brew "bat"
brew "code-minimap"
brew "curl"
brew "exa"
brew "fd"
brew "fish"
brew "fzf"
brew "git"
brew "git-delta"
brew "gnupg"
brew "jq"
brew "neovim", args: ["HEAD"]
brew "rargs"
brew "rcm"
brew "ripgrep"
brew "sd"
brew "starship"
brew "tmux"
brew "vim"
brew "watchexec"

Dir.glob(File.join(File.expand_path("~/.config/dotfile"), "Brewfile.*")) do |path|
  instance_eval(File.read(path))
end
