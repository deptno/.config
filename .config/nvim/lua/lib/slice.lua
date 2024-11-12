---slice make table<a> subset
---@param startIndex number index
---@param endIndex number index
---@param tlb table list
---@return table
local slice = function (startIndex, endIndex, tlb)
  assert(type(startIndex) == "number", "startIndex: number")
  assert(type(endIndex) == "number", "endIndex: number")
  assert(type(tlb) == "table", "tlb: table(list)")

  local ret = {}

  for i, v in ipairs(tlb) do
    if i >= startIndex and i <= endIndex then
      table.insert(ret, v)
    end
  end

  return ret
end

return slice
