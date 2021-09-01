local lspnull = require("null-ls")

return function(register)
  register({
    lspnull.builtins.diagnostics.shellcheck,
    lspnull.builtins.formatting.shfmt,
  })
end
