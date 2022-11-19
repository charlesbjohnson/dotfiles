function indir
    cd $argv[1] || return 1
    direnv export fish | source
    eval $argv[2..-1]
    cd -
end
