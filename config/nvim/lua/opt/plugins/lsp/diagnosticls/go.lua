return function(setup)
  table.insert(setup.filetypes, "go")

  setup.init_options.filetypes.go = "golangci"
  setup.init_options.linters.golangci = {
    sourceName = "golangci",

    command = "golangci-lint",
    args = { "run", "--out-format", "json" },
    rootPatterns = { "go.mod", ".git" },

    debounce = 100,

    parseJson = {
      sourceName = "Pos.Filename",
      sourceNameFilter = true,

      errorsRoot = "Issues",
      message = "(${FromLinter}) ${Text}",

      line = "Pos.Line",
      column = "Pos.Column",
    },
  }
end
