function fish_user_keybindings
    fish_vi_key_bindings
    fzf_key_bindings

    bind p fish_clipboard_paste

    bind yy fish_clipboard_copy
    bind Y fish_clipboard_copy

    bind \cZ fg
    bind --mode insert \cZ fg
end
