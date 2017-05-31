# https://github.com/sorin-ionescu/prezto/blob/master/modules/gnu-utility/init.zsh

! dotfile::command_exists "gwhoami" && return

gnu_utility_prefix="g"
gnu_utility_cmds=(
  # Coreutils
  "[" "base64" "basename" "cat" "chcon" "chgrp" "chmod" "chown"
  "chroot" "cksum" "comm" "cp" "csplit" "cut" "date" "dd" "df"
  "dir" "dircolors" "dirname" "du" "echo" "env" "expand" "expr"
  "factor" "false" "fmt" "fold" "groups" "head" "hostid" "id"
  "install" "join" "kill" "link" "ln" "logname" "ls" "md5sum"
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

for gnu_utility_cmd in "${gnu_utility_cmds[@]}"; do
  gnu_utility_prefixed_cmd="${gnu_utility_prefix}${gnu_utility_cmd}"
  if dotfile::command_exists "${gnu_utility_prefixed_cmd}"; then
    eval "
      function ${gnu_utility_cmd} {
        '${gnu_utility_prefixed_cmd}' \"\$@\"
      }
    "
  fi
done

unset gnu_utility_prefix
unset gnu_utility_cmds
unset gnu_utility_cmd
unset gnu_utility_prefixed_cmd
