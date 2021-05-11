return function(setup)
  table.insert(setup.filetypes, "sh")

  setup.init_options.filetypes.sh = "shellcheck"
  setup.init_options.linters.shellcheck = {
    sourceName = "shellcheck",

    command = "shellcheck",
    args    = {"--format", "json", "-"},

    debounce = 100,

    parseJson = {
      message  = "(SC${code}) ${message}",
      security = "level",

      line      = "line",
      endLine   = "endLine",
      column    = "column",
      endColumn = "endColumn"
    },

    securities = {
      error   = "error",
      warning = "warning",
      info    = "info",
      style   = "hint"
    }
  }

  setup.init_options.formatFiletypes.sh = "shfmt"
  setup.init_options.formatters.shfmt = {
    command = "shfmt"
  }
end
