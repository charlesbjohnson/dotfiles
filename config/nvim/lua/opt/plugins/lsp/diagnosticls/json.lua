return function(setup)
  table.insert(setup.filetypes, "json")

  setup.init_options.formatFiletypes.json = "prettier"
  setup.init_options.formatters.prettier = {
    command      = "npm",
    args         = {"exec", "--yes", "--parseable", "--", "prettier", "--stdin-filepath", "%filepath"},
    rootPatterns = {"package.json", ".git"},
  }
end
