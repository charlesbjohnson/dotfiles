" .vimrc
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details


" For multi-byte character support (CJK support, for example):
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1


" Plugins
if filereadable(expand('~/.vimrc.bundles'))
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
colorscheme base16-solarized
set background=dark
set number                              " Line numbers
set cursorline                          " Highlights cursor line
set scrolloff=20                        " Keep 20 scroll lines above/below cursor
set nowrap                              " Disable displaying lines as wrapped
set colorcolumn=80                      " Highlight column at 80 characters
set list listchars=tab:⇥⇥,eol:↵,trail:· " Control character highlighting
set showcmd                             " Show (partial) command in status line.


" Gvim settings
if has('gui_running')
  set guioptions=                       " Get rid of menu icons, toolbar, etc
  set guioptions=ai                     " Use console-style tabs and include icon
  set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline\ 11
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
set nohlsearch                          " When there is a previous search pattern, don't highlight all
                                        " its matches.

set incsearch                           " Increment search
set ignorecase                          " Case-insensitive search
set smartcase                           " Search becomes sensitive if caps used
set nowritebackup                       " No backup files while editing
set nobackup                            " Don't keep backups
set noswapfile                          " Don't create a swap file


" Filetypes
" TODO figure out how to get surround macros for *.tpl
autocmd! BufNewFile,BufRead *.tpl set ft=html syntax=mustache
" To use erb surround macros (from vim-rails) in combination with emmet macros
" TODO reconcile this with ultisnips html snippets
autocmd! BufNewFile,BufRead *.erb set ft=html syntax=eruby ft=eruby


" Key bindings
inoremap <M-Space> <Esc>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>

" Stop that stupid window from popping up
map q: :q

" Move line up/down
nnoremap <Leader>j ddp
nnoremap <Leader>k ddkP

" Buffers (creation, deletion, cycling) and delete all buffers
nnoremap <Leader>b :enew<CR>
nnoremap <Leader>BB :Bdelete<CR>
nnoremap <Leader>BD :bufdo :Bdelete<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>h :bp<CR>

" Tabs (creation, deletion, cycling)
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>T :tabclose<CR>
nnoremap <Leader>L :tabnext<CR>
nnoremap <Leader>H :tabprevious<CR>

" Consistent indent/unindent across all modes
nnoremap <C-t> >>
nnoremap <C-d> <<
vnoremap <C-t> >gv
vnoremap <C-d> <gv

" Switch between splits more easily
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-l> <C-w><C-l>

" Ctags
nnoremap <Leader>[ :pop<CR>
nnoremap <Leader>] <C-]>

" Automatically jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Plugin settings

" NERDTree
function! QuitIfNERDTreeOnly()
  if (winnr('$') == 1 && exists('b:NERDTreeType') && b:NERDTreeType == 'primary')
    quit
  endif
endfunction

nnoremap <Leader>o :NERDTreeToggle<CR>
autocmd BufEnter * call QuitIfNERDTreeOnly()

" indent lines
let g:indentLine_char = '┆'

" Ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.ctags
nnoremap <C-b> :CtrlPBuffer<CR>

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'

" git-gutter
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0
let g:gitgutter_map_keys = 0

" Ag
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" easytags
set tags=./.ctags;
let g:easy_tags_auto_update = 0
let g:easytags_updatetime_warn = 0
let g:easytags_dynamic_files = 2
nnoremap <Leader>ct :!ctags -f .ctags -R .<CR>
autocmd BufEnter * let g:easytags_auto_update = isdirectory('.git')

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Tagbar
nnoremap <Leader>O :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_width = 25

" vim-rspec
nnoremap <Leader>rs :call RunNearestSpec()<CR>
nnoremap <Leader>rf :call RunCurrentSpecFile()<CR>
let g:rspec_command = 'Dispatch rspec {spec}'

" emmet.vim
let g:user_emmet_install_global = 0
autocmd FileType html,erb,css EmmetInstall
let g:user_emmet_mode = 'n'
let g:user_emmet_leader_key = '<CR>'

" togglelist
let g:toggle_list_no_mappings = 1
nnoremap <Leader>P :call ToggleLocationList()<CR>
nnoremap <Leader>p :call ToggleQuickfixList()<CR>

" extradite
nmap <Leader>gd :Extradite<CR>

" easy-align
vmap <CR> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" language tool
let g:languagetool_jar = '/usr/share/languagetool/languagetool-commandline.jar'

" ultisnips
inoremap <C-e> <NOP>
let g:UltiSnipsExpandTrigger='<C-e>'

" better-whitespace
let g:strip_whitespace_on_save = 1

" easygrep
let g:EasyGrepFilesToExclude = '.git,bower_components,node_modules,vendor,.bundle'
let g:EasyGrepCommand = 1
let g:EasyGrepRecursive = 1

" goldenview
let g:goldenview__enable_default_mapping = 0
nmap <silent> <C-w>v  <Plug>GoldenViewSplit

" vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" splitjoin
nmap <Leader>K :SplitjoinSplit<CR>
nmap <Leader>J :SplitjoinJoin<CR>

" tern
let g:tern_show_signature_in_pum = 1
autocmd BufEnter * set completeopt-=preview
