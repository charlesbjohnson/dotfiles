require("ext.string")

local M = {}

function M.dirname(path)
  return (vim.fn.system({ "dirname", path })):trim()
end

function M.join(paths, sep)
  return string.join(paths, (sep or "/"))
end

function M.resolve(path)
  return (vim.fn.system({ "realpath", path })):trim()
end

return M
