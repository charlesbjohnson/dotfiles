function dotfile::append_path
    if test "$PATH" = "."
        export PATH=$argv[1]
    else if not contains $argv[1] $PATH
        export PATH="$PATH:$argv[1]"
    end
end

function dotfile::prepend_path
    if test "$PATH" = "."
        export PATH=$argv[1]
    else if not contains $argv[1] $PATH
        export PATH="$argv[1]:$PATH"
    end
end

function unset
    set --erase $argv[1]
end

function dotfile::load
    if test -f $argv[1]
        source $argv[1]
    end
end

function dotfile::load_all
    for file in $(find -L $argv[1] -name $argv[2] -type f)
        source $file
    end
end
