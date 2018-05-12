" Rust
call dein#add('rust-lang/rust.vim', { 'on_ft': ['rust'] })
call dein#add('sebastianmarkow/deoplete-rust', { 'on_ft': ['rust'], 'build': 'cargo install --force racer' })
