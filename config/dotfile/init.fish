function dotfile::append_env
  if not contains $argv[1] $argv[2]
    set --append $argv[1] $argv[2]
  end
end

function dotfile::prepend_env
  if not contains $argv[1] $argv[2]
    set --prepend $argv[1] $argv[2]
  end
end

function dotfile::set_env
  set --export --global $argv[1] $argv[2]
end

function dotfile::load
  if test -f $argv[1]
    source $argv[1]
  end
end

function dotfile::load_all
  for file in (find -L $argv[1] -maxdepth 1 -name $argv[2] -type f)
    source $file
  end
end

function dotfile::alias
  alias $argv[1] $argv[2]
end
