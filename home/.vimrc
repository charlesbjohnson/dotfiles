".vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details
" For multi-byte character support (CJK support, for example):
" set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1


" Plugins
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif


" General Settings
syntax on
filetype plugin indent on
set encoding=utf8
set nocompatible                        " Be improved
set mouse=a                             " Enable mouse
let mapleader=' '
set clipboard=unnamedplus               " Use OS clipboard
set hidden                              " Quick buffer switching
set ruler                               " Show cursor position

set formatoptions=c,q,t                 " This is a sequence of letters which describes how
                                        " automatic formatting is to be done.
                                        "
                                        " letter    meaning when present in 'formatoptions'
                                        " ------    ---------------------------------------
                                        " c         Auto-wrap comments using textwidth, inserting
                                        "           the current comment leader automatically.
                                        " q         Allow formatting of comments with "gq".
                                        " t         Auto-wrap text using textwidth (does not apply
                                        "           to comments)


set showmatch                           " When a bracket is inserted, briefly jump to the matching
                                        " one. The jump is only done if the match can be seen on the
                                        " screen. The time to show the match can be set with
                                        " 'matchtime'.

set wildmode=longest:full,full          " Tab completion for vim commands
set wildmenu
set noerrorbells
set nostartofline
set splitbelow
set splitright


" Appearance settings
set showtabline=2                       " File tabs always visible
set laststatus=2                        " Show statusline even when no window split
let base16colorspace=256                " Access colors present in 256 colorspace (MUST BE BEFORE COLORSCHEME)
colorscheme base16-default
set background=dark
set number                              " Line numbers
set cursorline                          " Highlights cursor line
set scrolloff=20                        " Keep 20 scroll lines above/below cursor
set colorcolumn=80                      " Highlight column at 80 characters
set list listchars=tab:⇥⇥,eol:↵,trail:· " Control character highlighting
set showcmd                             " Show (partial) command in status line.


" Gvim settings
if has('gui_running')
  set guioptions=                       " Get rid of menu icons, toolbar, etc
  set guioptions=ai                     " Use console-style tabs and include icon
endif


" Tab settings
set expandtab                           " Number of spaces that a Tab counts for
set tabstop=2                           " Tab is 2 spaces
set softtabstop=2
set shiftwidth=2                        " Number of spaces to use for each step of (auto)indent
set backspace=indent,eol,start
set autoindent
set cindent
set smarttab                            " When on, a <Tab> in front of a line inserts blanks
                                        " according to 'shiftwidth'. 'tabstop' is used in other
                                        " places. A <BS> will delete a 'shiftwidth' worth of space
                                        " at the start of the line.


" Searching and history settings
set hlsearch                            " When there is a previous search pattern, highlight all
                                        " its matches.

set incsearch                           " Increment search
set ignorecase                          " Case-insensitive search
set smartcase                           " Search becomes sensitive if caps used
set nowritebackup                       " No backup files while editing
set nobackup                            " Don't keep backups
set noswapfile                          " Don't create a swap file


" Functions
function! StripWhitespace()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    :%s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfunction


" Key bindings
noremap <leader>ss :call StripWhitespace()<CR>

" Move line down
noremap <leader>j ddp
" Move line up
noremap <leader>k ddkP

" Buffers
noremap <leader>b :enew<CR>
noremap <leader>B :BD<CR>
noremap <leader>p :bn<CR>
noremap <leader>P :bp<CR>

" Tabs
noremap <leader>t :tabnew<CR>
noremap <leader>T :tabclose<CR>
noremap <leader>n :tabnext<CR>
noremap <leader>N :tabprevious<CR>

" Indent/unindent
noremap <tab> >>
noremap <S-tab> <<

" Switch between splits more easily
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>
noremap <C-h> <C-w><C-h>
noremap <C-l> <C-w><C-l>


" Plugin settings

" NERDTree
let g:NERDTreeWinPos = "right"
noremap <leader>o :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:nerdtree_tabs_open_on_console_startup = 1

" Indent Guides
let indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 2
let g:indent_guides_exclude_filetypes = ['nerdtree']

" EasyMotion
let g:EasyMotion_leader_key = '<leader>g'

" Ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" git-gutter
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Tagbar
noremap <leader>O :TagbarToggle<CR>
let g:tagbar_left=1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let g:tagbar_width=30
