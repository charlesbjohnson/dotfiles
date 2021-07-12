local M = {}

function M.mapping(mode)
  return function(key, binding, options)
    vim.api.nvim_set_keymap(mode, key, binding, vim.tbl_extend("force", { noremap = true }, options or {}))
  end
end

function M.highlight(name, options)
  local definitions = {}

  if options.bg then
    options.guibg = options.bg
    options.bg = nil
  end

  if options.fg then
    options.guifg = options.fg
    options.fg = nil
  end

  if options.style then
    options.gui = options.style
    options.style = nil
  end

  for k, v in pairs(options or {}) do
    table.insert(definitions, string.join({ k, v }, "="))
  end

  vim.cmd(string.join({
    "highlight",
    name,
    string.join(definitions, " "),
  }, " "))
end

function M.highlight_link(from, to)
  vim.cmd(string.join({ "highlight", "link", from, to }, " "))
end

return M
