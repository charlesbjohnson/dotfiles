[private]
@default:
    just --list --unsorted

# Print this help message
@help: default

# Run the formatters
@fmt: fmt-just fmt-json fmt-fish fmt-sh fmt-lua

# Run the formatter for Just
[private]
@fmt-just *OPTS:
    just --unstable --fmt --quiet {{ OPTS }}

# Run the formatter for JSON
[private]
@fmt-json *OPTS:
    fd --strip-cwd-prefix --glob "**/*.json" | rargs bash -c 'echo "$(gron "{}" | sort | gron --ungron)" > "{}"'

# Run the formatter for Lua
[private]
@fmt-lua *OPTS:
    fd --strip-cwd-prefix --glob "**/*.lua" | rargs stylua {{ OPTS }} {}

# Run the formatter for Fish
[private]
@fmt-fish *OPTS:
    fd --strip-cwd-prefix --glob "**/*.fish" | rargs fish_indent --write {{ OPTS }} {}

# Run the formatter for Shell
[private]
fmt-sh *OPTS:
    #!/usr/bin/env bash
    sort --unique \
      <(rg --glob "!Justfile" --files-with-matches "(#!/bin/sh|#!/usr/bin/env bash|# fmt=shfmt)") \
      <(fd --strip-cwd-prefix --glob "**/*.sh") \
    | rargs shfmt -w {{ OPTS }} {}
