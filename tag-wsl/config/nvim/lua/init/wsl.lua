vim = _G.vim

vim.g.clipboard = {
  name = "wsl",
  copy = {
    ["+"] = {"pbcopy"},
    ["*"] = {"pbcopy"}
  },
  paste = {
    ["+"] = {"pbpaste"},
    ["*"] = {"pbpaste"}
  }
}
