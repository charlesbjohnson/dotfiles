local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

local fs = require("fs")
local path = require("path")

local M = {}

local function use_rubocop()
  local current = vim.api.nvim_buf_get_name(0)
  if current == "" then
    current = path.cwd()
  end

  return fs.find_closest(current, { ".rubocop.yml" })
end

function M.registration(register)
  if use_rubocop() then
    register({
      method = lspnull.methods.DIAGNOSTICS,
      filetypes = { "ruby" },
      generator = lspnull_h.generator_factory({
        command = "bundle",
        args = ("exec rubocop --stdin $FILENAME --stderr --force-exclusion --format json"):split(" "),

        to_stdin = true,
        from_stderr = true,
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

          local items = table.dig(params, { "output", "files", "[1]", "items" }) or {}
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
    })

    register({
      method = lspnull.methods.FORMATTING,
      filetypes = { "ruby" },
      generator = lspnull_h.formatter_factory({
        command = "bundle",
        args = ("exec rubocop --stdin $FILENAME --stderr --force-exclusion --auto-correct"):split(" "),
        to_stdin = true,
        format = "raw",
      }),
    })
  end
end

function M.root_patterns()
  return { "Gemfile" }
end

return M
