local M = {}

function M.exists(path)
  return M.is_directory(path) or M.is_file(path)
end

function M.glob(path, pattern)
  if not M.is_directory(path) then
    return {}
  end

  return (vim.fn.globpath(path, (pattern or "*"))):split("\n")
end

function M.is_directory(path)
  return vim.fn.isdirectory(path) == 1
end

function M.is_file(path)
  return vim.fn.findfile(path) ~= ""
end

return M
