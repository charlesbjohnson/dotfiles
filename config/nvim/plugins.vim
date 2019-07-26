if &compatible
  set nocompatible
endif

call plug#begin('~/.local/share/nvim/plugins')

" Local configuration overrides
for file in split(glob('~/.config/nvim/plugins.*.vim'), '\n')
  execute 'source' file
endfor

" System
Plug 'Julian/vim-textobj-variable-segment'
Plug 'Shougo/deoplete.nvim'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'danro/rename.vim'
Plug 'glts/vim-textobj-comment'
Plug 'honza/vim-snippets'
Plug 'itmammoth/doorboy.vim'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'mhinz/vim-sayonara'
Plug 'milkypostman/vim-togglelist'
Plug 'sgur/vim-editorconfig'
Plug 'svermeulen/vim-easyclip'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/repmo.vim'
Plug 'w0rp/ale'

" Productivity
Plug 'AndrewRadev/splitjoin.vim'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin --xdg' }
Plug 'junegunn/vim-easy-align'
Plug 'rhysd/committia.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-vinegar'
Plug 'zirrostig/vim-schlepp'

" Search & Replace
Plug 'RRethy/vim-illuminate'
Plug 'andymass/vim-matchup'
Plug 'justinmk/vim-sneak'
Plug 'vasconcelloslf/vim-interestingwords'

" Appearance
Plug 'Yggdroot/indentLine'
Plug 'arcticicestudio/nord-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
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
Plug 'tpope/vim-markdown', { 'for': ['markdown']}
Plug 'ujihisa/neco-look', { 'for': ['markdown', 'html'] }

call plug#end()

" Broken
" Plug 'haya14busa/incsearch.vim' https://github.com/neovim/neovim/issues/3688
