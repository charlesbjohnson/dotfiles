function dotfile::append_path
    set --local paths $(string split ":" $argv[1])

    for path in $paths
        if test "$PATH" = "."
            export PATH=$path
        else if not contains $path $PATH
            export PATH="$PATH:$path"
        end
    end
end

function dotfile::prepend_path
    set --local paths $(string split ":" $argv[1])

    for path in $paths[-1..1]
        if test "$PATH" = "."
            export PATH=$path
        else if not contains $path $PATH
            export PATH="$path:$PATH"
        end
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
    while read --null --local file
        source $file
    end <$(find -L $argv[1] -name $argv[2] -type f -print0 | psub)
end
