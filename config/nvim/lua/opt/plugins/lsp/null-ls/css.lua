local lspconfig_u = require("lspconfig.util")

local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

local fs = require("fs")
local config_patterns = lspconfig_u.root_pattern("package.json", "stylelint.config.*js", ".stylelintrc.*")

local function use_stylelint()
  local path = config_patterns(vim.api.nvim_buf_get_name(0))
  if not path then
    return false
  end

  if path:match("stylelint.config%.c?js$") then
    return true
  elseif path:match("%.stylelintrc%..+$") then
    return true
  elseif vim.endswith(path, "package.json") then
    local pkg = string.parse_json(fs.read_file(path))
    if pkg and pkg.stylelint then
      return true
    end
  end

  return false
end

return function(register)
  if use_stylelint() then
    register({
      method = lspnull.methods.DIAGNOSTICS,
      filetypes = { "css" },
      generator = lspnull_h.generator_factory({
        command = "npm",
        args = ("exec --yes --parseable -- stylelint --stdin --stdin-filename $FILENAME --formatter json"):split(" "),

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
    })

    register({
      method = lspnull.methods.FORMATTING,
      filetypes = { "css" },
      generator = lspnull_h.formatter_factory({
        command = "npm",
        args = ("exec --yes --parseable -- stylelint --stdin --stdin-filename $FILENAME --fix"):split(" "),
        to_stdin = true,
        format = "raw",
      }),
    })

    return
  end

  register({
    method = lspnull.methods.FORMATTING,
    filetypes = { "css" },
    generator = lspnull_h.formatter_factory({
      command = "npm",
      args = ("exec --yes --parseable -- @fsouza/prettierd $FILENAME"):split(" "),
      to_stdin = true,
      format = "raw",
    }),
  })
end
