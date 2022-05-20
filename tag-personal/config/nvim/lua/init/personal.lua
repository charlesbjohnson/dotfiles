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

-- AndrewRadev/splitjoin.vim
vim.g.splitjoin_html_attributes_bracket_on_new_line = 1

vim.g.splitjoin_ruby_do_block_split = 0
vim.g.splitjoin_ruby_hanging_args = 0
vim.g.splitjoin_ruby_options_as_arguments = 1

-- windwp/nvim-autopairs
require("nvim-autopairs").add_rules(require("nvim-autopairs.rules.endwise-ruby"))
