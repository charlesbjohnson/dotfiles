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

function M.read_file_json(path)
  local ok, result

  ok, result = pcall(vim.fn.readfile, path)
  if not ok then
    return nil
  end

  ok, result = pcall(vim.fn.json_decode, result)
  if not ok then
    return nil
  end

  return result
end

return M
