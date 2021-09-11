local lspnull = require("null-ls")
local lspnull_h = require("null-ls.helpers")

return function(register)
  register({
    method = lspnull.methods.DIAGNOSTICS,
    filetypes = { "fish" },
    generator = lspnull_h.generator_factory({
      command = "fish",
      args = ("--no-execute $FILENAME"):split(" "),

      to_stderr = true,

      format = "line",
      on_output = lspnull_h.diagnostics.from_pattern([=[^.*%(line (%d+)%): (.*)$]=], { "row", "message" }),
      diagnostics_format = "#{m} (#{s})",
    }),
  })

  register(lspnull.builtins.formatting.fish_indent)
end
