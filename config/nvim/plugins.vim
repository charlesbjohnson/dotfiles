if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugins')

" Local configuration overrides
for file in split(glob('~/.config/nvim/plugins.*.vim'), '\n')
  execute 'source' file
endfor

" Text Objects
Plug 'Julian/vim-textobj-variable-segment'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'

" Motions
Plug 'christoomey/vim-sort-motion'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/repmo.vim'

" Application Controls
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf'
Plug 'mhinz/vim-sayonara'
Plug 'milkypostman/vim-togglelist'
Plug 'rhysd/committia.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tpope/vim-vinegar'

" Application Enhancements
Plug 'danro/rename.vim'
Plug 'editorconfig/editorconfig-vim'

" Editor Controls
Plug 'AndrewRadev/splitjoin.vim', { 'branch': 'main' }
Plug 'itmammoth/doorboy.vim'
Plug 'junegunn/vim-easy-align'
Plug 'psliwka/vim-smoothie'
Plug 'svermeulen/vim-cutlass'
Plug 'zirrostig/vim-schlepp'

" Editor Enhancements
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Search & Replace
Plug 'RRethy/vim-illuminate'
Plug 'andymass/vim-matchup'

" Editor Appearance
Plug 'Yggdroot/indentLine'
Plug 'arcticicestudio/nord-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'

" Syntax & Language Enhancements
Plug 'cespare/vim-toml', { 'for': ['toml'] }
Plug 'dag/vim-fish', { 'for': ['fish'] }
Plug 'elzr/vim-json', { 'for': ['json'] }
Plug 'masukomi/vim-markdown-folding', { 'for': ['markdown'] }
Plug 'tpope/vim-git', { 'for': ['gitconfig'] }

call plug#end()
