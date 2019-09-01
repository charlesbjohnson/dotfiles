""" Plugins

"" System
" w0rp/ale
let g:ale_fixers = {}
let g:ale_linters = {}

let g:ale_fixers['css'] = ['stylelint']
let g:ale_fixers['scss'] = ['stylelint']
let g:ale_linters['css'] = ['stylelint']
let g:ale_linters['scss'] = ['stylelint']

" let g:ale_fixers['go'] = ['goimports']
" let g:ale_linters['go'] = ['go build', 'gosimple']

let g:ale_fixers['javascript'] = ['xo']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_linters['javascript'] = ['xo']

let g:ale_fixers['ruby'] = ['rubocop']
let g:ale_linters['ruby'] = ['rubocop']
let g:ale_ruby_rubocop_executable = 'bundle'

let g:ale_fixers['rust'] = ['rustfmt']
let g:ale_linters['rust'] = ['cargo', 'rustc']

let g:ale_fixers['sh'] = ['shfmt']
let g:ale_linters['sh'] = ['shellcheck']

"" Golang
" fatih/vim-go
" let g:go_def_mapping_enabled = 0
" let g:go_doc_keywordprg_enabled = 0
" let g:go_fmt_autosave = 0

"" Rust
" sebastianmarkow/deoplete-rust
let g:deoplete#sources#rust#disable_keymap = 1
let g:deoplete#sources#rust#racer_binary = systemlist('which racer')[0]
let g:deoplete#sources#rust#rust_source_path = systemlist('rustc --print sysroot')[0] . '/lib/rustlib/src/rust/src'
