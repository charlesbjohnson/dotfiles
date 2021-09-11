require("ext.string")

local M = {}

function M.cwd()
  return vim.loop.cwd()
end

function M.dirname(path)
  return (vim.fn.system({ "dirname", path })):trim()
end

function M.join(paths, sep)
  return string.join(paths, (sep or "/"))
end

function M.resolve(path)
  return vim.loop.fs_realpath(path)
end

return M
