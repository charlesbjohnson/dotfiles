" w0rp/ale
let g:ale_fix_on_save = 0
let g:ale_lint_on_save = 0

unlet g:ale_fixers['css']
unlet g:ale_fixers['javascript']
unlet g:ale_fixers['ruby']

let g:ale_linters['ruby'] = []
