""" Load bundles
if filereadable(expand('~/.config/nvim/init.bundles.vim'))
  source ~/.config/nvim/init.bundles.vim
endif


""" Local configuration
if filereadable(expand('~/.config/nvim/init.local.vim'))
  source ~/.config/nvim/init.local.vim
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
set viminfo='100,n$HOME/.nvim/files/info/nviminfo
set visualbell t_vb=
set wildmode=longest:full,full
syntax on


""" Appearance
colorscheme base16-solarized-dark
let base16colorspace=256
set background=dark
set colorcolumn=80
set completeopt-=preview
set cursorline
set laststatus=2
set list listchars=tab:⇥⇥,eol:↵,trail:·
set nowrap
set number
set scrolloff=20
set showcmd
set showtabline=2


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
map q: <NOP>

" No Ex mode
map Q <NOP>

" No help window
map <F1> <Esc>
imap <F1> <Esc>

" Buffers (creation, deletion, cycling) and delete all buffers
nnoremap <Leader>BB :Sayonara!<CR>
nnoremap <Leader>BD :bufdo :Sayonara!<CR>
nnoremap <Leader>b :enew<CR>
nnoremap <Leader>h :bp<CR>
nnoremap <Leader>l :bn<CR>

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
nnoremap > }
nnoremap H 0
nnoremap L $
xnoremap < {
xnoremap > }
xnoremap H 0
xnoremap L $

" Splits
nnoremap <C-w>\| :vsplit<CR>
nnoremap <C-w>_ :split<CR>
nnoremap <C-w>h :vertical resize -5<CR>
nnoremap <C-w>j :resize -5<CR>
nnoremap <C-w>k :resize +5<CR>
nnoremap <C-w>l :vertical resize +5<CR>

" Ctag navigation
nnoremap <Leader>[ :pop<CR>
nnoremap <Leader>] <C-]>

" Automatically jump to end of pasted text
nnoremap <silent> p p`]
xnoremap <silent> p p`]
xnoremap <silent> y y`]


""" Bundles

"" System
" Shougo/deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#file#enable_buffer_path = 1

inoremap <silent><expr> <TAB>
\  pumvisible() ?
\    "\<C-n>" :
\    <SID>check_back_space() ?
\      "\<TAB>" :
\      deoplete#mappings#manual_complete()

function! s:check_back_space() abort "{{{"
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Shougo/neosnippet.vim
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory = '~/.nvim/bundle/repos/github.com/honza/vim-snippets'

imap <C-e> <Plug>(neosnippet_expand_or_jump)

" bkad/CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" milkypostman/vim-togglelist
let g:toggle_list_no_mappings = 1

nnoremap <silent> <Leader>P :call ToggleLocationList()<CR>
nnoremap <silent> <Leader>p :call ToggleQuickfixList()<CR>

" neomake/neomake
let g:neomake_css_lint_maker = { 'exe': 'styleline' }
let g:neomake_javascript_lint_maker = { 'exe': 'eslint' }
let g:neomake_ruby_lint_maker = { 'exe': 'ruby-lint' }
let g:neomake_sh_lint_maker = { 'exe': 'shellcheck' }

augroup neomake_execute
  autocmd Filetype * Neomake
  autocmd BufWritePost * Neomake
augroup END

" svermeulen/vim-easyclip
let g:EasyClipPreserveCursorPositionAfterYank = 1

" terryma/vim-expand-region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
let g:expand_region_text_objects = {
\  'ii':  0,
\  'ai':  0,
\  'iv':  0,
\  'av':  0,
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
\  'ic':  0,
\  'ac':  0,
\  'ie':  0
\}

"" Productivity
" AndrewRadev/splitjoin.vim
let g:splitjoin_align = 1
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_trailing_comma = 0

nnoremap <silent> <Leader>J :call <SID>try('SplitjoinJoin',  'J')<CR>
nnoremap <silent> <Leader>K :call <SID>try('SplitjoinSplit', "r\015")<CR>

function! s:try(cmd, default) abort "{{{"
  if exists(':' . a:cmd) && !v:count
    let tick = b:changedtick
    execute a:cmd
    if tick == b:changedtick
      execute join(['normal!', a:default])
    endif
  else
    execute join(['normal! ', v:count, a:default], '')
  endif
endfunction"}}}

" Shougo/vimfiler.vim
let g:vimfiler_as_default_explorer = 1

" junegunn/fzf.vim
nnoremap <C-p> :FZF --multi<CR>

" junegunn/vim-easy-align
nmap <Leader>a <Plug>(EasyAlign)
xmap <CR> <Plug>(EasyAlign)

" kristijanhusak/vim-multiple-cursors
let g:multi_cursor_quit_key = '<C-e>'

" zirrostig/vim-schlepp
xmap <unique> <Leader>h <Plug>SchleppLeft
xmap <unique> <Leader>j <Plug>SchleppDown
xmap <unique> <Leader>k <Plug>SchleppUp
xmap <unique> <Leader>l <Plug>SchleppRight

"" Search & Replace
" mhinz/vim-grepper
nnoremap <leader>g :Grepper -tool ag -cword -noprompt<cr>
nnoremap <leader>G :Grepper -tool ag -noopen<CR>

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

"" vasconcelloslf/vim-interestingwords
" workaround https://github.com/lfv89/vim-interestingwords/issues/20
nmap <silent> <Leader>f <Plug>InterestingWords
nnoremap <silent> <Leader>f :call InterestingWords('n')<CR>
xnoremap <silent> <Leader>f :call InterestingWords('v')<CR>

nmap <silent> <Leader>F <Plug>InterestingWordsClear
nmap <silent> <Leader>N <Plug>InterestingWordsBackward
nmap <silent> <Leader>n <Plug>InterestingWordsForeward

"" Appearance
" Yggdroot/indentLine
let g:indentLine_char = '┆'
let g:indentLine_noConcealCursor=''

" mhinz/vim-signify
let g:signify_vcs_list = ['git']

" vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'

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

" ntpeters/vim-better-whitespace
let g:strip_whitespace_on_save = 1

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

function! s:is_at_start_of_line(mapping) abort "{{{"
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction"}}}

"" Golang
" fatih/vim-go
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_fmt_command = "goimports"

"" JavaScript
" elzr/vim-json
let g:vim_json_syntax_conceal = 0

"" Web
" mattn/emmet-vim
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key = '<CR>'
let g:user_emmet_mode = 'n'

autocmd FileType html EmmetInstall
