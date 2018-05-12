" w0rp/ale
let g:ale_linters['rust'] = ['rustfmt']

"" Rust
" sebastianmarkow/deoplete-rust
let g:deoplete#sources#rust#disable_keymap = 1
let g:deoplete#sources#rust#racer_binary = systemlist('which racer')[0]
let g:deoplete#sources#rust#rust_source_path = systemlist('rustc --print sysroot')[0] . '/lib/rustlib/src/rust/src'
