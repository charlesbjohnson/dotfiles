return function(setup)
  table.insert(setup.filetypes, "yaml")

  setup.init_options.filetypes.yaml = "yamllint"
  setup.init_options.linters.yamllint = {
    sourceName = "yamllint",

    command = "yamllint",
    args    = {"--format", "parsable", "-"},

    debounce = 100,

    formatLines   = 1,
    formatPattern = {
      [=[^.*:(\d+):(\d+): \[(error|warning)\] ([^(]+) \(([^)]+)\)$]=],
      {
        line     = 1,
        column   = 2,
        security = 3,
        message  = {"(", 5, ") ", 4},
      }
    },

    securities = {
      error   = "error",
      warning = "warning"
    }
  }

  setup.init_options.formatFiletypes.yaml = "prettier"
  setup.init_options.formatters.prettier = {
    command      = "npm",
    args         = {"exec", "--yes", "--parseable", "--", "prettier", "--stdin-filepath", "%filepath"},
    rootPatterns = {"package.json", ".git"},
  }
end
