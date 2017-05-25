if &compatible
  set nocompatible
endif

set runtimepath+=~/.nvim/plugins/repos/github.com/Shougo/dein.vim
call dein#begin('~/.nvim/plugins')
call dein#add('Shougo/dein.vim')

" Local configuration
if filereadable(expand('~/.config/nvim/plugins.local.vim'))
  source ~/.config/nvim/plugins.local.vim
endif

" System
call dein#add('neovim/node-host', { 'build': 'npm install' })

call dein#add('Julian/vim-textobj-variable-segment')
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimproc.vim', { 'build': 'make' })
call dein#add('danro/rename.vim')
call dein#add('glts/vim-textobj-comment')
call dein#add('haya14busa/dein-command.vim')
call dein#add('honza/vim-snippets')
call dein#add('itmammoth/doorboy.vim')
call dein#add('kana/vim-textobj-entire')
call dein#add('kana/vim-textobj-indent')
call dein#add('kana/vim-textobj-line')
call dein#add('kana/vim-textobj-user')
call dein#add('mhinz/vim-sayonara')
call dein#add('milkypostman/vim-togglelist')
call dein#add('neomake/neomake')
call dein#add('svermeulen/vim-easyclip')
call dein#add('terryma/vim-expand-region')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-surround')
call dein#add('vim-scripts/repmo.vim')

" Productivity
call dein#add('AndrewRadev/splitjoin.vim')
call dein#add('Shougo/vimfiler.vim')
call dein#add('christoomey/vim-sort-motion')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('junegunn/fzf', { 'build': './install --all' })
call dein#add('junegunn/vim-easy-align')
call dein#add('rhysd/committia.vim')
call dein#add('roxma/vim-tmux-clipboard')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tmux-plugins/vim-tmux-focus-events')
call dein#add('tpope/vim-vinegar')
call dein#add('zirrostig/vim-schlepp')

" Search & Replace
call dein#add('justinmk/vim-sneak')
call dein#add('vasconcelloslf/vim-interestingwords')

" Appearance
call dein#add('Yggdroot/indentLine')
call dein#add('chriskempson/base16-vim')
call dein#add('edkolev/tmuxline.vim')
call dein#add('mhinz/vim-signify')
call dein#add('mhinz/vim-startify')
call dein#add('ntpeters/vim-better-whitespace')
call dein#add('ryanoasis/vim-devicons')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

" DevOps
call dein#add('ekalinin/dockerfile.vim', { 'on_ft': ['Dockerfile'] })
call dein#add('markcornick/vim-hashicorp-tools')
call dein#add('tmux-plugins/vim-tmux', { 'on_ft': ['tmux'] })
call dein#add('tpope/vim-git', { 'on_ft': ['gitconfig'] })

" Docs
call dein#add('dhruvasagar/vim-table-mode', { 'on_ft': ['markdown'] })
call dein#add('tpope/vim-markdown', { 'on_ft': ['markdown']})
call dein#add('ujihisa/neco-look', { 'on_ft': ['markdown', 'html'] })

" Golang
call dein#add('fatih/vim-go', { 'on_ft': ['go'], 'hook_add': 'GoInstallBinaries' })
call dein#add('zchee/deoplete-go', { 'on_ft': ['go'], 'build': 'make', 'depends': 'vim-go' })

" JavaScript
call dein#add('carlitux/deoplete-ternjs', { 'on_ft': ['javascript'], 'build': 'npm install -g tern' })
call dein#add('elzr/vim-json', { 'on_ft': ['json'] })
" call dein#add('othree/yajs.vim', { 'on_ft': ['javascript'], 'rev': '1.6' })
call dein#add('pangloss/vim-javascript', { 'on_ft': ['javascript'] })

" Ruby
call dein#add('vim-ruby/vim-ruby', { 'on_ft': ['ruby'] })

" Web
call dein#add('ap/vim-css-color', { 'on_ft': ['css', 'scss'] })
call dein#add('hail2u/vim-css3-syntax', { 'on_ft': ['css', 'scss'] })
call dein#add('mattn/emmet-vim', { 'on_ft': ['html'] })
call dein#add('othree/html5.vim', { 'on_ft': ['html'] })
call dein#add('valloric/MatchTagAlways', { 'on_ft': ['html'] })

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif


" Broken
" call dein#add('haya14busa/incsearch.vim') https://github.com/neovim/neovim/issues/3688
