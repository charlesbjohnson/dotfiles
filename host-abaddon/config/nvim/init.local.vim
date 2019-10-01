""" Plugins

"" System
" dense-analysis/ale
let g:ale_fixers['css'] = ['stylelint']
let g:ale_linters['css'] = ['stylelint']

let g:ale_fixers['scss'] = g:ale_fixers['css']
let g:ale_linters['scss'] = g:ale_linters['css']

let g:ale_fixers['javascript'] = ['xo']
let g:ale_fixers['typescript'] = ['prettier']
let g:ale_javascript_eslint_suppress_missing_config = 1
let g:ale_linters['javascript'] = ['xo']

" let g:ale_fixers['rust'] = ['rustfmt']
" let g:ale_linters['rust'] = ['cargo', 'rustc']

let g:ale_fixers['sh'] = ['shfmt']
let g:ale_linters['sh'] = ['shellcheck']
