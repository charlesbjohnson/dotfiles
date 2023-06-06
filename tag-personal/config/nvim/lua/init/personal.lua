vim.filetype.add({
  pattern = {
    [".*%.css%.erb"] = "eruby.css",
    [".*%.html%.erb"] = "eruby.html",
    [".*%.js%.erb"] = "eruby.javascript",
    [".*%.md%.erb"] = "eruby.markdown",
  },
})

vim.treesitter.language.register("css", "eruby.css")
vim.treesitter.language.register("html", "eruby.html")
vim.treesitter.language.register("javascript", "eruby.javascript")
vim.treesitter.language.register("markdown", "eruby.markdown")
