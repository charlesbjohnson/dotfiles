function dotfile::append_env
    set --local name $argv[1]
    set --local values $argv[2]

    if not set --query $name
        export $name=$values
        return
    end

    for value in $(string split ":" $values)
        if not contains $value $$name
            set --append $name $value
        end
    end
end

function dotfile::prepend_env
    set --local name $argv[1]
    set --local values $argv[2]

    if not set --query $name
        export $name=$values
        return
    end

    for value in $(string split ":" $values)[-1..1]
        if not contains $value $$name
            set --prepend $name $value
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
    for file in $(find -L $argv[1] -name $argv[2] -type f)
        source $file
    end
end

function dotfile::alias
    alias $argv[1] $argv[2]
end
