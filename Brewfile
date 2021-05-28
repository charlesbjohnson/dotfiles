def local(name)
  brew "~/.config/homebrew/formula/#{name}.rb"
end

tap "homebrew/bundle"
tap "homebrew/core"

brew "asdf"
brew "bat"
brew "direnv"
brew "exa"
brew "fd"
brew "fish"
brew "fzf"
brew "gdb"
brew "git-delta"
brew "jq"
brew "just"
brew "neovim", args: ["HEAD"]
brew "netcat"
brew "python"
brew "ranger"
brew "rargs"
brew "rcm"
brew "readline"
brew "ripgrep"
brew "rsync"
brew "sd"
brew "shellcheck"
brew "shfmt"
brew "starship"
brew "tmux"
brew "vim"
brew "watchexec"
brew "wget"
brew "yamllint"

local "code-minimap"

Dir.glob(File.join(File.expand_path("~/.config/dotfile"), "Brewfile.*")) do |path|
  instance_eval(File.read(path))
end
