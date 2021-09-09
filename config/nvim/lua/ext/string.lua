function string.join(strs, sep)
  local result = ""

  for i, v in ipairs(strs) do
    result = result .. v

    if i < #strs then
      result = result .. sep
    end
  end

  return result
end

function string.parse_json(str)
  local ok, result = pcall(vim.fn.json_decode, str)
  if not ok or result == vim.NIL then
    return nil
  end

  return result
end

function string.split(str, sep)
  return vim.split(str, sep)
end

function string.trim(str)
  return vim.trim(str)
end
