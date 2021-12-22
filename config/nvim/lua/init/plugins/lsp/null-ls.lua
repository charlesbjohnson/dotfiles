local lspnull = require("null-ls")
local lspconfig_u = require("lspconfig.util")

local sources = require.tree("init.plugins.lsp.null-ls")
local root_patterns = { ".null-ls-root", ".git" }

for _, source in pairs(sources) do
  if type(source) == "table" then
    if type(source.registration) == "function" then
      source.registration(lspnull.register)
    end

    if type(source.root_patterns) == "function" then
      for _, root_pattern in ipairs(source.root_patterns()) do
        table.insert(root_patterns, 1, root_pattern)
      end
    end
  end
end

lspnull.setup({
  diagnostics_format = "[#{c}] #{m} (#{s})",
  root_dir = lspconfig_u.root_pattern(root_patterns)
})
