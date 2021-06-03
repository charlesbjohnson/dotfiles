return function(setup)
  table.insert(setup.filetypes, "ruby")

  setup.init_options.filetypes.ruby = "rubocop"
  setup.init_options.linters.rubocop = {
    sourceName = "rubocop",

    command      = "bundle",
    args         = {"exec", "rubocop", "--format", "json", "--force-exclusion", "--stdin", "%filepath"},
    rootPatterns = {"Gemfile", ".git"},

    debounce = 100,

    parseJson = {
      errorsRoot = "files[0].offenses",

      message  = "(${cop_name}) ${message}",
      security = "severity",

      line      = "location.start_line",
      endline   = "location.last_line",
      column    = "location.start_column",
      endColumn = "location.last_column"
    },

    securities = {
      convention = "info",
      error      = "error",
      fatal      = "error",
      info       = "info",
      refactor   = "hint",
      warning    = "warning"
    }
  }

  setup.init_options.formatFiletypes.ruby = "rubocop"
  setup.init_options.formatters.rubocop = {
    command      = "bundle",
    args         = {"exec", "rubocop", "--auto-correct", "--force-exclusion", "--stdin", "%filepath", "--stderr"},
    rootPatterns = {"Gemfile", ".git"},
  }
end
