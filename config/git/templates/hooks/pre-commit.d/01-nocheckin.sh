#!/usr/bin/env bash

FILES=()

while IFS= read -r -d '' file; do
  if grep --quiet --fixed-strings "@nocheckin" "$file"; then
    FILES+=("$file")
  fi
done < <(git diff --staged --diff-filter=d --name-only -z)

if [ ${#FILES[@]} -ne 0 ]; then
  echo "pre-commit/nocheckin: found in ${#FILES[@]} file(s), aborting commit"

  for file in "${FILES[@]}"; do
    echo "- $file"
  done

  exit 1
fi

exit 0
