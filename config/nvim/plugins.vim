if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugins')

lua require("plugins")

" Local configuration overrides
for file in split(glob('~/.config/nvim/plugins.*.vim'), '\n')
  execute 'source' file
endfor

call plug#end()
