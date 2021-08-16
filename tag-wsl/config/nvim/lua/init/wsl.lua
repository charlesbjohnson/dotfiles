vim.g.clipboard = {
  name = "wsl",
  copy = {
    ["+"] = { "pbcopy" },
    ["*"] = { "pbcopy" },
  },
  paste = {
    ["+"] = { "pbpaste" },
    ["*"] = { "pbpaste" },
  },
}
