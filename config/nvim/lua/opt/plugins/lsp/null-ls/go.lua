local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

local M = {}

function M.registration(register)
  register({
    method = lspnull.methods.DIAGNOSTICS,
    filetypes = { "go" },
    generator = lspnull_h.generator_factory({
      command = "golangci-lint",
      args = ("run --out-format json"):split(" "),

      check_exit_code = { 0, 1 },

      format = "json",
      on_output = function(params)
        local diagnostics = {}
        local severities = {
          error = lspnull_h.diagnostics.severities["error"],
          warning = lspnull_h.diagnostics.severities["warning"],
        }

        local items = params.output and params.output.Issues ~= vim.NIL and params.output.Issues or {}
        for _, item in ipairs(items) do
          if vim.fn.fnamemodify(params.bufname, ":p:.") == item.Pos.Filename then
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

return M
