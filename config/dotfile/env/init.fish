function dotfile::env::brew
    unset HOMEBREW_SHELLENV_PREFIX

    if not string match --quiet "*brew*" $PATH
        eval "$($argv[1]/bin/brew shellenv)"
    end
end

# https://github.com/sorin-ionescu/prezto/blob/master/modules/gnu-utility/init.zsh
function dotfile::env::gnu
    if not command --search --quiet gwhoami
        return
    end

    set prefix $argv[1]
    set cmds \
        # Coreutils
        "[" b2sum base32 base64 basename basenc cat chcon chgrp \
        chmod chown chroot cksum comm cp csplit cut \
        date dd df dir dircolors dirname du echo env expand expr \
        factor false fmt fold groups head hostid id install join \
        kill link ln logname ls md5sum mkdir mkfifo \
        mknod mktemp mv nice nl nohup nproc numfmt od \
        paste pathchk pinky pr printenv printf ptx pwd \
        readlink realpath rm rmdir runcon \
        seq sha1sum sha224sum sha256sum sha384sum sha512sum shred shuf \
        sleep sort split stat stdbuf stty sum sync tac tail \
        tee test timeout touch tr true truncate tsort tty \
        uname unexpand uniq unlink uptime users vdir \
        wc who whoami yes \
        # Binutils
        addr2line ar 'c++filt' coffdump dlltool dllwrap elfedit nm \
        objcopy objdump ranlib readelf \
        size srconv strings strip sysdump windmc windres \
        # Findutils
        find locate oldfind updatedb xargs \
        # Libtool
        libtool libtoolize \
        # Miscellaneous
        egrep fgrep getopt grep indent make sed tar time units \
        which
    for cmd in $cmds
        set prefixed_cmd "$prefix$cmd"

        if not command --search --quiet $prefixed_cmd
            continue
        end

        if command --search --quiet $cmd && test builtin = "$(type --type $cmd)"
            continue
        end

        eval "function $cmd; $prefixed_cmd \$argv; end"
    end
end

function dotfile::env::shell
    export SHELL="$(which "$(ps -p %self -o "comm=" | sed "s/-//")")"
end

function dotfile::env::windows
    for path in $(PATH="$PATH_OLD" powershell.exe "\$env:PATH -split ';'" | xargs -d "\n" -I "{}" wslpath "{}" | tr -d "\r")
        dotfile::append_path "$path"
    end
end
