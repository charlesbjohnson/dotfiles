""" Load plugins
if filereadable(expand('~/.config/nvim/plugins.vim'))
  source ~/.config/nvim/plugins.vim
endif


""" General
let mapleader=' '
set clipboard=unnamed
set hidden
set nostartofline
set ruler
set showmatch
set splitbelow
set splitright
set viminfo='100,n$HOME/.local/share/nvim/files/info/nviminfo
set visualbell t_vb=
set wildmode=longest:full,full
syntax on


""" Appearance
set background=dark
set colorcolumn=80
set completeopt-=preview
set cursorline
set laststatus=2
set list listchars=tab:⇥⇥,eol:↵,trail:·
set noshowmode
set nowrap
set number
set scrolloff=20
set showcmd
set showtabline=2
set termguicolors


""" Tabbing
set cindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2


""" Search & History
set ignorecase
set inccommand=nosplit
set noswapfile
set nowritebackup
set smartcase


""" Key bindings
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>

" No confusing window
noremap q: <NOP>

" No Ex mode
noremap Q <NOP>

" No help window
noremap <F1> <Esc>
inoremap <F1> <Esc>

" Quickly clear highlighted search
nnoremap <silent> <Leader><Leader> :nohlsearch<CR>

" Buffers (creation, deletion, cycling) and delete all buffers
nnoremap <silent> <Leader>BB :Sayonara!<CR>
nnoremap <silent> <Leader>BD :bufdo :Sayonara!<CR>
nnoremap <silent> <Leader>b :enew<CR>
nnoremap <silent> <Leader>h :bp<CR>
nnoremap <silent> <Leader>l :bn<CR>

" Tabs (creation, deletion, cycling)
nnoremap <Leader>H :tabprevious<CR>
nnoremap <Leader>L :tabnext<CR>
nnoremap <Leader>TT :tabclose<CR>
nnoremap <Leader>t :tabnew<CR>

" Consistent indent/unindent across all modes
nnoremap <C-d> <<
nnoremap <C-t> >>
xnoremap <C-d> <gv
xnoremap <C-t> >gv

" Move around more quickly
nnoremap < {
xnoremap < {
nnoremap > }
xnoremap > }
nnoremap H 0
xnoremap H 0
nnoremap L $
xnoremap L $

" Splits
nnoremap <silent> <C-w>\| :vsplit<CR>
nnoremap <silent> <C-w>_ :split<CR>
nnoremap <silent> <C-w>h :vertical resize +5<CR>
nnoremap <silent> <C-w>j :resize -5<CR>
nnoremap <silent> <C-w>k :resize +5<CR>
nnoremap <silent> <C-w>l :vertical resize -5<CR>

" Ctag navigation
nnoremap <silent> <Leader>[ :pop<CR>
nnoremap <Leader>] <C-]>

" Automatically jump to end of pasted text
nnoremap <silent> p p`]
xnoremap <silent> p p`]
xnoremap <silent> y y`]


""" Plugins

"" System
" itmammoth/doorboy.vim
inoremap <expr> <BS> doorboy#map_backspace()
inoremap <expr> <Space> doorboy#map_space()
inoremap <expr> <CR> doorboy#map_cr()

" milkypostman/vim-togglelist
let g:toggle_list_no_mappings = 1

nnoremap <silent> <Leader>P :call ToggleLocationList()<CR>
nnoremap <silent> <Leader>p :call ToggleQuickfixList()<CR>

" svermeulen/vim-cutlass
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

" w0rp/ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {}
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {}
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

"" Productivity
" AndrewRadev/splitjoin.vim
let g:splitjoin_align = 1
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_trailing_comma = 0

nnoremap <silent> <Leader>J :call <SID>try('SplitjoinJoin',  'J')<CR>
nnoremap <silent> <Leader>K :call <SID>try('SplitjoinSplit', "r\015")<CR>

function! s:try(cmd, default) abort
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

" junegunn/fzf.vim
nnoremap <silent> <C-p> :FZF --multi<CR>

" junegunn/vim-easy-align
nmap <Leader>a <Plug>(EasyAlign)
xmap <CR> <Plug>(EasyAlign)

" zirrostig/vim-schlepp
xmap <Leader>h <Plug>SchleppLeft
xmap <Leader>j <Plug>SchleppDown
xmap <Leader>k <Plug>SchleppUp
xmap <Leader>l <Plug>SchleppRight

"" Search & Replace
" andymass/vim-matchup
augroup matchup_configuration
  autocmd!
  autocmd ColorScheme * hi MatchParen cterm=italic gui=italic ctermfg=lightblue guifg=lightblue
  autocmd ColorScheme * hi MatchWord cterm=italic gui=italic ctermfg=lightblue guifg=lightblue
augroup END

" justinmk/vim-sneak
let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1

 " 2-character Sneak (default)
nmap S <Plug>Sneak_S
nmap s <Plug>Sneak_s
omap S <Plug>Sneak_S
omap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s

" replace 'f' with 1-char Sneak
nmap F <Plug>Sneak_F
nmap f <Plug>Sneak_f
omap F <Plug>Sneak_F
omap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f

" replace 't' with 1-char Sneak
nmap T <Plug>Sneak_T
nmap t <Plug>Sneak_t
omap T <Plug>Sneak_T
omap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t

"" Appearance
" Yggdroot/indentLine
let g:indentLine_char = '┆'
let g:indentLine_noConcealCursor=''

" arcticicestudio/nord-vim
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1

colorscheme nord

" edkolev/tmuxline.vim
let g:tmuxline_theme = 'lightline'
let g:tmuxline_preset = 'crosshair'

" itchyny/lightline.vim
let g:lightline = {
\  'colorscheme': 'nord',
\  'component_expand': {
\    'buffers': 'lightline#bufferline#buffers'
\  },
\  'component_function': {
\    'filetype': 'Devicon_filetype',
\    'fileformat': 'Devicon_fileformat',
\  },
\  'component_type': {
\    'buffers': 'tabsel'
\  },
\  'tabline': {
\    'left': [['buffers']],
\    'right': [[]]
\  }
\}

function! g:Devicon_filetype() abort
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! g:Devicon_fileformat() abort
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" mhinz/vim-signify
let g:signify_vcs_list = ['git']

" mhinz/vim-startify
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_restore_position = 1
let g:startify_relative_path = 1
let g:startify_custom_header = [
\  '',
\  '',
\  '          ::::    ::: :::::::::: ::::::::  :::     ::: :::::::::::   :::   :::',
\  '         :+:+:   :+: :+:       :+:    :+: :+:     :+:     :+:      :+:+: :+:+:',
\  '        :+:+:+  +:+ +:+       +:+    +:+ +:+     +:+     +:+     +:+ +:+:+ +:+',
\  '       +#+ +:+ +#+ +#++:++#  +#+    +:+ +#+     +:+     +#+     +#+  +:+  +#+',
\  '      +#+  +#+#+# +#+       +#+    +#+  +#+   +#+      +#+     +#+       +#+',
\  '     #+#   #+#+# #+#       #+#    #+#   #+#+#+#       #+#     #+#       #+#',
\  '    ###    #### ########## ########      ###     ########### ###       ###',
\  '    +=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=',
\  '    -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-='
\]

" ntpeters/vim-better-whitespace
let g:better_whitespace_enabled = 1
let g:better_whitespace_skip_empty_lines = 0
let g:show_spaces_that_precede_tabs = 1
let g:strip_only_modified_lines = 0
let g:strip_whitelines_at_eof = 1
let g:strip_whitespace_confirm = 0
let g:strip_whitespace_on_save = 1

"" Sysadmin
" elzr/vim-json
let g:vim_json_syntax_conceal = 0

"" Docs
" dhruvasagar/vim-table-mode
inoreabbrev <expr> <BAR><BAR>
\  <SID>is_at_start_of_line('\|\|') ?
\    '<C-o>:TableModeEnable<CR><BAR><SPACE><BAR><LEFT><LEFT>' :
\    '<BAR><BAR>'

inoreabbrev <expr> __
\  <SID>is_at_start_of_line('__') ?
\    '<C-o>:silent! TableModeDisable<CR>' :
\    '__'

function! s:is_at_start_of_line(mapping) abort
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction


" Local configuration overrides
for file in split(glob('~/.config/nvim/init.*.vim'), '\n')
  execute 'source' file
endfor
