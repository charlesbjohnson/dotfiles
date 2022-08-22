function table.dig(tbl, path)
  if type(tbl) ~= "table" or type(path) ~= "table" then
    return
  end

  for _, segment in ipairs(path) do
    if segment:starts_with("[") and segment:ends_with("]") then
      segment = tonumber(segment:sub(2, -2))
    end

    if tbl[segment] == nil or tbl[segment] == vim.NIL then
      return
    end

    tbl = tbl[segment]
  end

  return tbl
end
