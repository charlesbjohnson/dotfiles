local fs = require("fs")
local path = require("path")

local __require = require
local __cache = {}

local M = setmetatable({}, {
  __call = function(_, mod)
    return __require(mod)
  end,
})

local function to_file_path(require_path)
  return path.resolve(path.join({ path.dirname(M.main()), (require_path:gsub("%.", "/")) }))
end

local function to_require_path(file_path)
  file_path = file_path:gsub(path.dirname(M.main()), "")
  file_path = file_path:gsub("/", "", 1):gsub(".lua$", "")
  file_path = file_path:gsub("/", ".")

  return file_path
end

function M.main()
  return path.join({ vim.fn.stdpath("config"), "lua", "init.lua" })
end

function M.tree(require_path)
  if __cache[require_path] then
    return __cache[require_path]
  end

  local result = {}

  for _, child_file_path in ipairs(fs.glob(to_file_path(require_path))) do
    local child_require_path = to_require_path(child_file_path)

    if fs.is_directory(child_file_path) then
      result[child_require_path] = M.tree(child_require_path)
    else
      result[child_require_path] = require(child_require_path)
    end
  end

  __cache[require_path] = result
  return __cache[require_path]
end

return M
