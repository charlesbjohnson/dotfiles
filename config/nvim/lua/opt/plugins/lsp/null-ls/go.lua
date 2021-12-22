local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

local M = {}

function M.registration(register)
  register({
    method = lspnull.methods.DIAGNOSTICS,
    filetypes = { "go" },
    generator = lspnull_h.generator_factory({
      command = "golangci-lint",
      args = ("run --fix=false --out-format=json $DIRNAME --path-prefix $ROOT"):split(" "),

      check_exit_code = { 0, 1, 2 },

      format = "json",
      on_output = function(params)
        local diagnostics = {}
        local severities = {
          error = lspnull_h.diagnostics.severities["error"],
          warning = lspnull_h.diagnostics.severities["warning"],
        }

        local items = table.dig(params, { "output", "Issues" }) or {}
        for _, item in ipairs(items) do
          if params.bufname == item.Pos.Filename then
            table.insert(diagnostics, {
              row = item.Pos.Line,
              col = item.Pos.Column,
              message = item.Text,
              code = item.FromLinter,
              severity = severities[item.Severity] or lspnull_h.diagnostics.severities["warning"],
            })
          end
        end

        return diagnostics
      end,
    }),
  })
end

function M.root_patterns()
  return { "go.mod" }
end

return M
