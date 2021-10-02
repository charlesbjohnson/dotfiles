function table.dig(tbl, path)
  if type(tbl) ~= "table" or type(path) ~= "table" then
    return
  end

  for _, segment in ipairs(path) do
    if string.starts_with(segment, "[") and string.ends_with(segment, "]") then
      segment = tonumber(string.sub(segment, 2, -2))
    end

    if tbl[segment] == nil or tbl[segment] == vim.NIL then
      return
    end

    tbl = tbl[segment]
  end

  return tbl
end
