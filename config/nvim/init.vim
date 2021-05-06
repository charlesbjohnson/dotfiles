lua require("init")

""" Load plugins
if filereadable(expand('~/.config/nvim/plugins.vim'))
  source ~/.config/nvim/plugins.vim
endif

lua require("init.plugins")
