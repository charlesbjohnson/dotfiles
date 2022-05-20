return function(options)
  require("lspconfig").cssls.setup(vim.tbl_deep_extend("force", {}, options, {
    filetypes = { "css", "scss", "eruby.css", "eruby.scss" },

    settings = {
      css = {
        lint = {}, -- Avoid null pointer error
        validate = false,
      },
    },
  }))
end
