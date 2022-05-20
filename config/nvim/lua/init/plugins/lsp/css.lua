return function()
  return {
    filetypes = { "css", "scss", "eruby.css", "eruby.scss" },
    settings = {
      css = {
        lint = {}, -- Avoid null pointer error
        validate = false,
      },
    },
  }
end
