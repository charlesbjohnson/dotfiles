#!/usr/bin/env bash

function dotfile::env::brew() {
  unset HOMEBREW_SHELLENV_PREFIX

  if ! [[ "$PATH" =~ brew ]]; then
    eval "$("$1/bin/brew" shellenv)"

    if [[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
      source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
    else
      for COMPLETION in "$HOMEBREW_PREFIX/etc/bash_completion.d/"*; do
        [[ -r "$COMPLETION" ]] && source "$COMPLETION"
      done
    fi
  fi
}

# https://github.com/sorin-ionescu/prezto/blob/master/modules/gnu-utility/init.zsh
function dotfile::env::gnu() {
  if [[ "$(type whoami)" =~ gwhoami ]]; then
    return
  fi

  if ! command -v "gwhoami" &>/dev/null; then
    return
  fi

  local prefix="$1"
  local cmds=(
    # Coreutils
    "[" "b2sum" "base32" "base64" "basename" "basenc" "cat" "chcon" "chgrp"
    "chmod" "chown" "chroot" "cksum" "comm" "cp" "csplit" "cut"
    "date" "dd" "df" "dir" "dircolors" "dirname" "du" "echo" "env" "expand" "expr"
    "factor" "false" "fmt" "fold" "groups" "head" "hostid" "id" "install" "join"
    "kill" "link" "ln" "logname" "ls" "md5sum" "mkdir" "mkfifo"
    "mknod" "mktemp" "mv" "nice" "nl" "nohup" "nproc" "numfmt" "od"
    "paste" "pathchk" "pinky" "pr" "printenv" "printf" "ptx" "pwd"
    "readlink" "realpath" "rm" "rmdir" "runcon"
    "seq" "sha1sum" "sha224sum" "sha256sum" "sha384sum" "sha512sum" "shred" "shuf"
    "sleep" "sort" "split" "stat" "stdbuf" "stty" "sum" "sync" "tac" "tail"
    "tee" "test" "timeout" "touch" "tr" "true" "truncate" "tsort" "tty"
    "uname" "unexpand" "uniq" "unlink" "uptime" "users" "vdir"
    "wc" "who" "whoami" "yes"

    # The following utilities are not part of Coreutils but installed separately.

    # Binutils
    "addr2line" "ar" "c++filt" "coffdump" "dlltool" "dllwrap" "elfedit" "nm"
    "objcopy" "objdump" "ranlib" "readelf"
    "size" "srconv" "strings" "strip" "sysdump" "windmc" "windres"

    # Findutils
    "find" "locate" "oldfind" "updatedb" "xargs"

    # Libtool
    "libtool" "libtoolize"

    # Miscellaneous
    "egrep" "fgrep" "getopt" "grep" "indent" "make" "sed" "tar" "time" "units"
    "which"
  )

  for cmd in "${cmds[@]}"; do
    local cmd_type=$(type --type "$cmd")
    if [[ "$cmd_type" == "keyword" || "$cmd_type" == "builtin" ]]; then
      continue
    fi

    local prefixed_cmd="${prefix}${cmd}"
    if command -v "$prefixed_cmd" &>/dev/null; then
      eval "function $cmd() { $prefixed_cmd \"\$@\"; }"
      export -f "$cmd"
    fi
  done
}

function dotfile::env::shell() {
  export SHELL="$(which "$(ps -p "$$" -o "comm=" | sed "s/-//")")"
}

function dotfile::env::windows() {
  while read -r path; do
    dotfile::append_path "$path"
  done < <(env PATH="$PATH_OLD" powershell.exe "\$env:PATH -split ';'" | xargs -d "\n" -I "{}" wslpath "{}" | tr -d "\r")
}
