if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugins')

lua require("plugins")

call plug#end()
