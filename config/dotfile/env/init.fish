function dotfile::env::asdf
    if not string match --quiet "*asdf*" $PATH
        source $HOMEBREW_PREFIX/opt/asdf/asdf.fish
    end
end

function dotfile::env::brew
    eval ($argv[1]/bin/brew shellenv)
end

function dotfile::env::direnv
    direnv hook fish | source
end

function dotfile::env::fzf
    source $HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.fish && fzf_key_bindings
end

function dotfile::env::gpg
    dotfile::set_env GPG_TTY (tty)
end

# https://github.com/sorin-ionescu/prezto/blob/master/modules/gnu-utility/init.zsh
function dotfile::env::gnu
    if not command --search --quiet gwhoami
        return
    end

    set prefix $argv[1]
    set cmds \
        # Coreutils
        "[" base64 basename cat chcon chgrp chmod chown \
        chroot cksum comm cp csplit cut date dd df \
        dir dircolors dirname du echo env expand expr \
        factor false fmt fold groups head hostid id \
        install join kill link ln logname ls make md5sum \
        mkdir mkfifo mknod mktemp mv nice nl nohup nproc \
        od paste pathchk pinee pr printenv printf ptx \
        pwd readlink realpath rm rmdir runcon seq sha1sum \
        sha224sum sha256sum sha384sum sha512sum shred shuf \
        sleep sort split stat stty sum sync tac tail \
        tee test timeout touch tr true truncate tsort \
        tty uname unexpand uniq unlink uptime users vdir \
        wc who whoami yes \
        # Binutils
        addr2line ar "c++filt" elfedit nm objcopy objdump ranlib readelf size strings strip \
        # Findutils
        find locate oldfind updatedb xargs \
        # Libtool
        libtool libtoolize \
        # Miscellaneous
        getopt grep indent sed tar time units which

    for cmd in $cmds
        set prefixed_cmd "$prefix$cmd"

        if not command --search --quiet $prefixed_cmd
            continue
        end

        if command --search --quiet $cmd && test builtin = (type --type $cmd)
            continue
        end

        eval "function $cmd; $prefixed_cmd \$argv; end"
    end
end

function dotfile::env::ruby
    dotfile::prepend_env PATH $HOMEBREW_PREFIX/opt/ruby/bin
end
