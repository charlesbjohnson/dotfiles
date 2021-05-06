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
set updatetime=300
set viminfo='100,n$HOME/.local/share/nvim/files/info/nviminfo
set visualbell t_vb=
set wildmode=longest:full,full
syntax on


""" Appearance
set background=dark
set cmdheight=2
set colorcolumn=80
set completeopt-=preview
set cursorline
set laststatus=2
set list listchars=tab:⇥⇥,eol:↵,trail:·
set noshowmode
set nowrap
set number
set scrolloff=20
set shortmess+=c
set showcmd
set showtabline=2
set signcolumn=yes
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
" AndrewRadev/splitjoin.vim
let g:splitjoin_quiet = 1

let g:splitjoin_join_mapping = "cJ"
let g:splitjoin_split_mapping = "cK"

" Yggdroot/indentLine
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_fileTypeExclude = ['help', 'startify']

" andymass/vim-matchup
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_hi_surround_always = 1
let g:matchup_matchparen_offscreen = {'method': "popup"}
let g:matchup_surround_enabled = 1

" arcticicestudio/nord-vim
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

colorscheme nord

" dense-analysis/ale
let g:ale_disable_lsp = 1

let g:ale_fix_on_save = 1
let g:ale_fixers = {}

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {}

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0

" edkolev/tmuxline.vim
let g:tmuxline_theme = 'lightline'
let g:tmuxline_preset = 'crosshair'

" elzr/vim-json
let g:vim_json_syntax_conceal = 0

" itchyny/lightline.vim
let g:lightline = {
\  'colorscheme': 'nord',
\  'component_expand': {
\    'buffers': 'lightline#bufferline#buffers'
\  },
\  'component_function': {
\    'filetype': 'LightlineFileType',
\    'fileformat': 'LightlineFileFormat',
\  },
\  'component_type': {
\    'buffers': 'tabsel'
\  },
\  'tabline': {
\    'left': [['buffers']],
\    'right': [[]]
\  }
\}

function! g:LightlineFileType() abort
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! g:LightlineFileFormat() abort
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" itmammoth/doorboy.vim
inoremap <expr> <BS> doorboy#map_backspace()
inoremap <expr> <Space> doorboy#map_space()
inoremap <expr> <CR> doorboy#map_cr()

" junegunn/fzf.vim
nnoremap <silent> <C-p> :FZF --multi<CR>

" junegunn/vim-easy-align
nmap <Leader>a <Plug>(EasyAlign)
xmap <CR> <Plug>(EasyAlign)

" mengelbrecht/lightline-bufferline
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 2

" mhinz/vim-startify
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
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

" milkypostman/vim-togglelist
let g:toggle_list_no_mappings = 1

nnoremap <silent> <Leader>P :call ToggleLocationList()<CR>
nnoremap <silent> <Leader>p :call ToggleQuickfixList()<CR>

" neoclide/coc.nvim
inoremap <silent> <expr> <TAB>
\  pumvisible() ? "\<C-n>" :
\  <SID>check_back_space() ? "\<TAB>" :
\  coc#refresh()

inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation() abort
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

xmap <silent> v <Plug>(coc-range-select)

autocmd ColorScheme * hi CocCursorRange ctermbg=red guibg=red

nmap <expr> <silent> <C-i> <SID>select_current_cursor('normal')
xmap <expr> <silent> <C-i> <SID>select_current_cursor('visual')

let s:previous_cursor_mode = ''

function! s:select_current_cursor(mode) abort
  if !get(g:, 'coc_cursors_activated', 0)
    let s:previous_cursor_mode = a:mode

    if a:mode == 'visual'
      return "y/\\V\<C-r>=escape(@\", '/\\')\<CR>\<CR>Ngn\<Plug>(coc-cursors-range)n:nohlsearch\<CR>"
    endif

    return "\<Plug>(coc-cursors-word)"
  end

  if s:previous_cursor_mode == 'visual'
    return "gN\<Plug>(coc-cursors-range)n:nohlsearch\<CR>"
  endif

  return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
endfunction

" psliwka/vim-smoothie
let g:smoothie_no_default_mappings = 1
nmap <silent> <C-f> <Plug>(SmoothieForwards)
nmap <silent> <C-b> <Plug>(SmoothieBackwards)

" svermeulen/vim-cutlass
nnoremap m d
xnoremap m d
nnoremap mm dd
nnoremap M D

" zirrostig/vim-schlepp
xmap <Leader>h <Plug>SchleppLeft
xmap <Leader>j <Plug>SchleppDown
xmap <Leader>k <Plug>SchleppUp
xmap <Leader>l <Plug>SchleppRight

" Local configuration overrides
for file in split(glob('~/.config/nvim/init.*.vim'), '\n')
  execute 'source' file
endfor
