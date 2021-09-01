local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

return function(register)
  register({
    method = lspnull.methods.FORMATTING,
    filetypes = { "html" },
    generator = lspnull_h.formatter_factory({
      command = "npm",
      args = vim.split("exec --yes --parseable -- @fsouza/prettierd $FILENAME", " "),
      to_stdin = true,
      format = "raw",
    }),
  })
end
