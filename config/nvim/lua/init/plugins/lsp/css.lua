return function()
  return {
    settings = {
      css = {
        lint = {}, -- Avoid null pointer error
        validate = false,
      },
    },
  }
end
