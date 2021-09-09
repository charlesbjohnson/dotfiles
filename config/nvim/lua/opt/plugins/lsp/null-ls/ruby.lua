local lspconfig_u = require("lspconfig.util")

local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

local config_patterns = lspconfig_u.root_pattern(".rubocopy.yml")

local function use_rubocop()
  return type((config_patterns(vim.api.nvim_buf_get_name(0)))) == "string"
end

return function(register)
  if use_rubocop() then
    register({
      {
        method = lspnull.methods.DIAGNOSTICS,
        filetypes = { "ruby" },
        generator = lspnull_h.generator_factory({
          command = "bundle",
          args = vim.split("exec rubocop --stdin $FILENAME --stderr --force-exclusion --format json", " "),

          to_stdin = true,
          to_stderr = true,
          check_exit_code = { 0, 1 },

          format = "json",
          on_output = function(params)
            local diagnostics = {}
            local severities = {
              convention = lspnull_h.diagnostics.severities["warning"],
              error = lspnull_h.diagnostics.severities["error"],
              fatal = lspnull_h.diagnostics.severities["error"],
              info = lspnull_h.diagnostics.severities["information"],
              refactor = lspnull_h.diagnostics.severities["hint"],
              warning = lspnull_h.diagnostics.severities["warning"],
            }

            local items = params.output and params.output.files[1].items or {}
            for _, item in ipairs(items) do
              table.insert(diagnostics, {
                row = item.location.line,
                col = item.location.column,
                message = item.message,
                code = item.cop_name,
                severity = severities[item.severity],
                source = "rubocop",
              })
            end

            return diagnostics
          end,
        }),
      },

      {
        method = lspnull.methods.FORMATTING,
        filetypes = { "ruby" },
        generator = lspnull_h.formatter_factory({
          command = "bundle",
          args = vim.split("exec rubocop --stdin $FILENAME --stderr --force-exclusion --auto-correct", " "),
          to_stdin = true,
          format = "raw",
        }),
      },
    })
  end
end
