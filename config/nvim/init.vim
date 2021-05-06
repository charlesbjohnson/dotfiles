lua require("init")

""" Load plugins
if filereadable(expand('~/.config/nvim/plugins.vim'))
  source ~/.config/nvim/plugins.vim
endif

lua require("init.plugins")

" Local configuration overrides
for file in split(glob('~/.config/nvim/init.*.vim'), '\n')
  execute 'source' file
endfor
