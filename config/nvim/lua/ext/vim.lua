local M = {}

local option_scopes = {
  o = vim.o,
  wo = vim.wo,
  bo = vim.bo
}

function M.option(scope)
  return setmetatable({}, {
    __index = function(_, k)
      return option_scopes[scope][k]
    end,

    __newindex = function(_, k, v)
      option_scopes[scope][k] = v
      option_scopes["o"][k] = v
    end
  })
end

function M.mapping(mode)
  return function(key, binding, options)
    vim.api.nvim_set_keymap(
      mode,
      key,
      binding,
      vim.tbl_extend("force", {noremap = true}, options or {})
    )
  end
end

return M
