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

function string.split(str, sep)
  return vim.split(str, sep)
end

function string.trim(str)
  return vim.trim(str)
end
