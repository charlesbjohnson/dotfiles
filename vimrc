" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1


" Plugins
if filereadable(expand('~/.vimrc.bundles'))
  source ~/.vimrc.bundles
endif


" Local configuration
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif


" General Settings
syntax on
filetype plugin indent on
set encoding=utf8
set nocompatible                        " Be improved
set shell=zsh
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
set visualbell t_vb=
set nostartofline
set splitbelow
set splitright
set viminfo='100,n$HOME/.vim/files/info/viminfo


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


" MacVim settings
if has("gui_macvim")
  set clipboard=unnamed
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
set hlsearch                            " When there is a previous search pattern highlight all
                                        " its matches.
set ignorecase                          " Case-insensitive search
set smartcase                           " Search becomes sensitive if caps used
set nowritebackup                       " No backup files while editing
set nobackup                            " Don't keep backups
set noswapfile                          " Don't create a swap file


" Filetypes
" TODO figure out how to get surround macros for *.tpl
autocmd! BufNewFile,BufRead *.tpl set filetype=html syntax=mustache
autocmd! BufNewFile,BufRead *.ejs set filetype=html
" To use erb surround macros (from vim-rails) in combination with emmet macros
" TODO reconcile this with ultisnips html snippets
autocmd! BufNewFile,BufRead *.erb set filetype=html syntax=eruby filetype=eruby
autocmd! BufRead,BufNewFile *.json set filetype=json


" Key bindings
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>

" Stop that stupid window from popping up
map q: <NOP>

" Not gonna use Ex mode ever
map Q <NOP>

" No, I don't want the help window. Stupid fat fingers.
map <F1> <Esc>
imap <F1> <Esc>

" Buffers (creation, deletion, cycling) and delete all buffers
nnoremap <Leader>b :enew<CR>
nnoremap <Leader>BB :Bdelete<CR>
nnoremap <Leader>BD :bufdo :Bdelete<CR>
nnoremap <Leader>l :bn<CR>
nnoremap <Leader>h :bp<CR>

" Tabs (creation, deletion, cycling)
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>TT :tabclose<CR>
nnoremap <Leader>L :tabnext<CR>
nnoremap <Leader>H :tabprevious<CR>

" Consistent indent/unindent across all modes
nnoremap <C-t> >>
nnoremap <C-d> <<
vnoremap <C-t> >gv
vnoremap <C-d> <gv

" Move around more quickly
nnoremap H 0
vnoremap H 0
nnoremap L $
vnoremap L $
nnoremap < {
nnoremap > }
vnoremap < {
vnoremap > }

" Splits
nnoremap <C-w>\| :vsplit<CR>
nnoremap <C-w>_ :split<CR>
nnoremap <C-w>j :resize -5<CR>
nnoremap <C-w>k :resize +5<CR>
nnoremap <C-w>h :vertical resize -5<CR>
nnoremap <C-w>l :vertical resize +5<CR>

" Ctags
nnoremap <Leader>[ :pop<CR>
nnoremap <Leader>] <C-]>

" Automatically jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]


" Plugin settings

" NeoBundle
let g:neobundle#install_process_timeout = 600

" Indent lines
let g:indentLine_char = '┆'

" Vimfiler
let g:vimfiler_as_default_explorer = 1

" Ctrlp
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.ctags
nnoremap <C-b> :CtrlPBuffer<CR>
nnoremap <C-i> :CtrlPSwitch<CR>
unmap <Tab>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'

" Git-gutter
let g:gitgutter_eager = 0
let g:gitgutter_realtime = 0
let g:gitgutter_map_keys = 0

" Ag
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" Syntastic
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_aggregate_errors = 1

let g:syntastic_css_checkers = ['prettycss', 'csslint', 'recess']
let g:syntastic_css_recess_args = '--noOverqualifying --noUnderscores'

" TODO make a jscs style guide
"let g:syntastic_javascript_checkers = ['eslint', 'jscs']
let g:syntastic_javascript_checkers = ['eslint']

" TODO get these globally-installed gems working within bundler managed projects
"let g:syntastic_ruby_checkers = ['rubylint', 'rubocop', 'reek']

let g:syntastic_sh_checkers = ['shellcheck']

" Rspec
nnoremap <silent> <Leader>rs :call RunNearestSpec()<CR>
nnoremap <silent> <Leader>rf :call RunCurrentSpecFile()<CR>
let g:rspec_command = 'Dispatch rspec {spec}'

" Emmet.vim
let g:user_emmet_install_global = 0
autocmd FileType html,erb,ejs,css EmmetInstall
let g:user_emmet_mode = 'n'
let g:user_emmet_leader_key = '<CR>'

" Togglelist
let g:toggle_list_no_mappings = 1
nnoremap <silent> <Leader>P :call ToggleLocationList()<CR>
nnoremap <silent> <Leader>p :call ToggleQuickfixList()<CR>

" Multiple cursors
let g:multi_cursor_quit_key = '<C-e>'

" Incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map n <Plug>(incsearch-nohl-n)
map N <Plug>(incsearch-nohl-N)
map * <Plug>(incsearch-nohl-*)
map # <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
let g:incsearch#consistent_n_direction = 1
let g:incsearch#auto_nohlsearch = 1
let g:incsearch#highlight = {
\  'match' : {
\    'group' : 'IncSearchUnderline',
\    'priority' : '10'
\  },
\  'on_cursor' : {
\    'priority' : '100'
\  },
\  'cursor' : {
\    'group' : 'ErrorMsg',
\    'priority' : '1000'
\  }
\}

" Over
nnoremap <silent> <Leader>r :OverCommandLine<CR>

" Easy-align
vmap <CR> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

" Splitjoin
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
let g:splitjoin_align = 1
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_trailing_comma = 0
nnoremap <silent> <Leader>J :call <SID>try('SplitjoinJoin',  'J')<CR>
nnoremap <silent> <Leader>K :call <SID>try('SplitjoinSplit', "r\015")<CR>

function! s:try(cmd, default)
  if exists(':' . a:cmd) && !v:count
    let tick = b:changedtick
    execute a:cmd
    if tick == b:changedtick
      execute join(['normal!', a:default])
    endif
  else
    execute join(['normal! ', v:count, a:default], '')
  endif
endfunction

" Sneak
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1
"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F
"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

" Interestingwords
let g:interestingWordsDefaultMappings = 0
" to disable the default mappings, workaround since plugin config is busted
nnoremap <silent> <Leader>k <Plug>InterestingWords
nnoremap <silent> <Leader>f :call InterestingWords('n')<CR>
nnoremap <silent> <Leader>F :call UncolorAllWords()<CR>
nnoremap <silent> n :call WordNavigation(1)<CR>
nnoremap <silent> N :call WordNavigation(0)<CR>

" Schlepp
vmap <unique> <Leader>k <Plug>SchleppUp
vmap <unique> <Leader>j <Plug>SchleppDown
vmap <unique> <Leader>h <Plug>SchleppLeft
vmap <unique> <Leader>l <Plug>SchleppRight

" Ultisnips
inoremap <C-e> <NOP>
let g:UltiSnipsExpandTrigger='<C-e>'

" Better-whitespace
let g:strip_whitespace_on_save = 1

" Expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
let g:expand_region_text_objects = {
\  'ii':  0,
\  'ai':  0,
\  'i_':  0,
\  'a_':  0,
\  'iw':  0,
\  'iW':  0,
\  'i"':  0,
\  'i''': 0,
\  'i]':  0,
\  'a]':  0,
\  'ib':  0,
\  'ab':  0,
\  'iB':  0,
\  'aB':  0,
\  'il':  0,
\  'ip':  0,
\  'ie':  0
\}

" Youcompleteme
let g:ycm_global_ycm_extra_conf = '~/.vim/files/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1

" Tern
let g:tern_show_signature_in_pum = 1
autocmd BufEnter * set completeopt-=preview

" Startify
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_restore_position = 1
let g:startify_relative_path = 1
let g:startify_custom_header = [
\ '',
\ '',
\ '    +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+',
\ '    -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-',
\ '        ,.-.                          .-·,.            ;*;.',
\ '       /*$*'';\                       /**$*;''\''       ;*$*'';:\           .·´*'';\',
\ '       '';*@$*;:''       ,·,:-:,        ;*@$*;:::\     ;*@$@*'';:''\      .''*$@*$*;:''\',
\ '       '';*@*;::;     ,''*@,'''':;\     '';*$@*;::::;''    ;*@*,$*''·:;  .·‘*@´;:;@*,''::;''',
\ '        '';*$*'';::;   ,''$*,'':::''\''    ;*$*;::::;    ;*@*;''`.*@$*¨,*$*;:;''$*;:::;',
\ '        '';*@*;:;  ,''@*,'':::::;''    '';*@;''::::;     ;*$'';::; \*@$*@*;:;*@,'':::;‘',
\ '         ;*$*;:;''´$,''::::::;''       ;$*'';:::'';     '';@*,''::;  \*;:\;:$'';;:;:::;',
\ '         '';*@*''*@,·'':::::;''        '';*@;::::;''    ;*$'';::;     ''`´  @*'',·'':::;‘',
\ '          ,''*$*,.''\::;·´           \*´\:::;‘    \´¨\::;             *::::;',
\ '          \`*´\:::\;               ''\::\:;''      ''\::\;             \:\;·''',
\ '           ''\:::\;''                   `*´‘         ''´¨                ¨''',
\ '             `*´‘',
\ '    +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+',
\ '    -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-',
\ '',
\ '',
\ ]

highlight StartifyBracket ctermfg=166
highlight StartifyFile    ctermfg=253
highlight StartifyFooter  ctermfg=255
highlight StartifyHeader  ctermfg=196
highlight StartifyNumber  ctermfg=159
highlight StartifyPath    ctermfg=245
highlight StartifySection ctermfg=50
highlight StartifySelect  ctermfg=255
highlight StartifySlash   ctermfg=245
highlight StartifySpecial ctermfg=121
