return function(options)
  vim.list_extend(options.disable.filetypes, {
    "^.*$",
  })
end
