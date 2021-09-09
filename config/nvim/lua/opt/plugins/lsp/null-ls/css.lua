local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

local fs = require("fs")
local path = require("path")

local function use_stylelint()
  local root_dir = (vim.lsp.buf.list_workspace_folders() or {})[1] or path.cwd()

  local pkg = string.parse_json(fs.read_file(path.join({ root_dir, "package.json" }))) or {}
  if pkg.stylelint then
    return true
  end

  if fs.exists(path.join({ root_dir, "stylelint.config.js" })) then
    return true
  end

  return false
end

return function(register)
  if use_stylelint() then
    register({
      {
        method = lspnull.methods.DIAGNOSTICS,
        filetypes = { "css" },
        generator = lspnull_h.generator_factory({
          command = "npm",
          args = vim.split(
            "exec --yes --parseable -- stylelint --stdin --stdin-filename $FILENAME --formatter json",
            " "
          ),

          to_stdin = true,
          check_exit_code = { 0, 1, 2 },

          format = "json",
          on_output = function(params)
            local diagnostics = {}

            local items = params.output and params.output[1].warnings or {}
            for _, item in ipairs(items) do
              table.insert(diagnostics, {
                row = item.line,
                col = item.column,
                message = (item.text:gsub("%s*%(" .. (item.rule):gsub("%-", "%%-") .. "%)$", "")),
                code = item.rule,
                severity = lspnull_h.diagnostics.severities[item.severity],
                source = "stylelint",
              })
            end

            return diagnostics
          end,
        }),
      },

      {
        method = lspnull.methods.FORMATTING,
        filetypes = { "css" },
        generator = lspnull_h.formatter_factory({
          command = "npm",
          args = vim.split("exec --yes --parseable -- stylelint --stdin --stdin-filename $FILENAME --fix", " "),
          to_stdin = true,
          format = "raw",
        }),
      },
    })

    return
  end

  register({
    method = lspnull.methods.FORMATTING,
    filetypes = { "css" },
    generator = lspnull_h.formatter_factory({
      command = "npm",
      args = vim.split("exec --yes --parseable -- @fsouza/prettierd $FILENAME", " "),
      to_stdin = true,
      format = "raw",
    }),
  })
end
