vim.filetype.add({
  pattern = {
    [".*%.css%.erb"] = "eruby.css",
    [".*%.html%.erb"] = "eruby.html",
    [".*%.js%.erb"] = "javascript",
  },
})
