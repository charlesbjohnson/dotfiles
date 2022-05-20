vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.css.erb" },
  callback = function()
    vim.bo.filetype = "eruby.css"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.html.erb" },
  callback = function()
    vim.bo.filetype = "eruby.html"
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.js.erb" },
  callback = function()
    vim.bo.filetype = "javascript"
  end,
})
