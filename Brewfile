brew 'asdf'
brew 'bat'
brew 'code-minimap'
brew 'diff-so-fancy'
brew 'direnv'
brew 'exa'
brew 'fd'
brew 'fish'
brew 'fzf'
brew 'gdb'
brew 'jq'
brew 'neovim', args: ['HEAD']
brew 'netcat'
brew 'parallel'
brew 'python@3'
brew 'ranger'
brew 'readline'
brew 'ripgrep'
brew 'rsync'
brew 'shellcheck'
brew 'shfmt'
brew 'starship'
brew 'thoughtbot/formulae/rcm'
brew 'tmux'
brew 'vim'
brew 'wdiff'
brew 'wget'
brew 'yamllint'
tap 'homebrew/bundle'
tap 'homebrew/core'
tap 'thoughtbot/formulae'
tap 'wfxr/code-minimap'

Dir.glob(File.join(File.expand_path('~/.config/dotfile'), 'Brewfile.*')) do |path|
  instance_eval(File.read(path))
end
