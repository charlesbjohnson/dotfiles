local lspnull = require("null-ls")

return function(register)
  if vim.fn.filereadable(".selene.toml") then
    register(lspnull.builtins.diagnostics.selene.with({ extra_args = { "--config", ".selene.toml" } }))
  else
    register(lspnull.builtins.diagnostics.selene)
  end

  register(lspnull.builtins.formatting.stylua)
end
