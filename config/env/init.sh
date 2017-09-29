function env::rbenv() {
  if ! [[ "$PATH" =~ rbenv ]]; then
    eval "$(rbenv init -)"
  fi
}

function env::nodenv() {
  if ! [[ "$PATH" =~ nodenv ]]; then
    eval "$(nodenv init -)"
  fi
}

function env::golang() {
  export GOPATH="$1"
  export GOROOT="$(go env GOROOT)"
}

# https://github.com/sorin-ionescu/prezto/blob/master/modules/gnu-utility/init.zsh
function env::gnu() {
  if [[ "$(type whoami)" =~ gwhoami ]]; then
    return
  fi

  if ! command -v "gwhoami" &>/dev/null; then
    return
  fi

  local prefix="$1"
  local cmds=(
    # Coreutils
    "[" "base64" "basename" "cat" "chcon" "chgrp" "chmod" "chown"
    "chroot" "cksum" "comm" "cp" "csplit" "cut" "date" "dd" "df"
    "dir" "dircolors" "dirname" "du" "echo" "env" "expand" "expr"
    "factor" "false" "fmt" "fold" "groups" "head" "hostid" "id"
    "install" "join" "kill" "link" "ln" "logname" "ls" "make" "md5sum"
    "mkdir" "mkfifo" "mknod" "mktemp" "mv" "nice" "nl" "nohup" "nproc"
    "od" "paste" "pathchk" "pinee" "pr" "printenv" "printf" "ptx"
    "pwd" "readlink" "realpath" "rm" "rmdir" "runcon" "seq" "sha1sum"
    "sha224sum" "sha256sum" "sha384sum" "sha512sum" "shred" "shuf"
    "sleep" "sort" "split" "stat" "stty" "sum" "sync" "tac" "tail"
    "tee" "test" "timeout" "touch" "tr" "true" "truncate" "tsort"
    "tty" "uname" "unexpand" "uniq" "unlink" "uptime" "users" "vdir"
    "wc" "who" "whoami" "yes"

    # The following utilities are not part of Coreutils but installed separately.

    # Binutils
    "addr2line" "ar" "c++filt" "elfedit" "nm" "objcopy" "objdump"
    "ranlib" "readelf" "size" "strings" "strip"

    # Findutils
    "find" "locate" "oldfind" "updatedb" "xargs"

    # Libtool
    "libtool" "libtoolize"

    # Miscellaneous
    "getopt" "grep" "indent" "sed" "tar" "time" "units" "which"
  )

  for cmd in "${cmds[@]}"; do
    local cmd_type=$(type --type "$cmd")
    if [[ "$cmd_type" = "keyword" || "$cmd_type" = "builtin" ]]; then
      continue
    fi

    local prefixed_cmd="${prefix}${cmd}"
    if command -v "$prefixed_cmd" &>/dev/null; then
      eval "
        function $cmd {
          '$prefixed_cmd' \"\$@\"
        }
      "
      export -f "$cmd"
    fi
  done
}
