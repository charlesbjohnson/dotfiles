function dotfile::set_env
  set --export --global $argv[1] $argv[2]
end

function dotfile::load_if_exists
  if test -f $argv[1]
    source $argv[1]
  end
end

function dotfile::load_all
  for file in (find -L $argv[1] -maxdepth 1 -name $argv[2] -type f)
    source $file
  end
end

function dotfile::path_prepend
  set args

  for arg in $argv
    set args $arg $args
  end

  for arg in $args
    if not contains $arg $PATH
      set PATH $arg $PATH
    end
  end
end

function dotfile::path_append
  for arg in $argv
    if not contains $arg $PATH
      set PATH $PATH $arg
    end
  end
end

function dotfile::alias
  alias $argv[1] $argv[2]
end
