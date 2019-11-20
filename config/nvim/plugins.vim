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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin --xdg' }
Plug 'mhinz/vim-sayonara'
Plug 'milkypostman/vim-togglelist'
Plug 'rhysd/committia.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-vinegar'

" Application Enhancements
Plug 'danro/rename.vim'
Plug 'sgur/vim-editorconfig'

" Editor Controls
Plug 'AndrewRadev/splitjoin.vim'
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
Plug 'justinmk/vim-sneak'

" Appearance
Plug 'Yggdroot/indentLine'
Plug 'arcticicestudio/nord-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ryanoasis/vim-devicons'

" Sysadmin
Plug 'cespare/vim-toml', { 'for': ['toml'] }
Plug 'dag/vim-fish', { 'for': ['fish'] }
Plug 'elzr/vim-json', { 'for': ['json'] }
Plug 'tmux-plugins/vim-tmux', { 'for': ['tmux'] }
Plug 'tpope/vim-git', { 'for': ['gitconfig'] }

" Docs
Plug 'dhruvasagar/vim-table-mode', { 'for': ['markdown'] }
Plug 'masukomi/vim-markdown-folding', { 'for': ['markdown'] }
Plug 'tpope/vim-markdown', { 'for': ['markdown']}

call plug#end()
