local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

return function(register)
  register({
    lspnull.builtins.diagnostics.eslint_d.with({
      command = "npm",
      args = vim.split("exec --yes --parseable -- eslint_d --stdin --stdin-filename $FILENAME --format json", " "),
      on_output = function(params)
        local items = params.output and params.output[1].messages or {}
        local parser = lspnull_h.diagnostics.from_json({
          attributes = {
            severity = "severity",
          },
          diagnostic = {
            source = "eslint",
          },
          severities = {
            lspnull_h.diagnostics.severities["warning"],
            lspnull_h.diagnostics.severities["error"],
          },
        })

        return parser({ output = items })
      end,
    }),

    lspnull.builtins.formatting.eslint_d.with({
      command = "npm",
      args = vim.split("exec --yes --parseable -- eslint_d --stdin --stdin-filename $FILENAME --fix-to-stdout", " "),
    }),
  })
end
