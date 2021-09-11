local M = {}

function M.exists(path)
  return M.is_directory(path) or M.is_file(path)
end

function M.find_closest(path, patterns)
  path = require("path").resolve(path)
  if not path then
    return nil
  end

  for _, v in ipairs(patterns) do
    local matches = M.glob(path, v)
    if #matches > 0 then
      return matches[1]
    end
  end

  if path == "/" then
    return nil
  else
    return M.find_closest(require("path").dirname(path), patterns)
  end
end

function M.glob(path, pattern)
  if not M.is_directory(path) then
    return {}
  end

  local result = vim.fn.globpath(path, (pattern or "*"))
  if result == "" then
    return {}
  end

  return result:split("\n")
end

function M.is_directory(path)
  return vim.fn.isdirectory(path) == 1
end

function M.is_file(path)
  return vim.fn.findfile(path) ~= ""
end

function M.read_file(path)
  local ok, result = pcall(vim.fn.readfile, path)
  if not ok then
    return nil
  end

  return result
end

return M
