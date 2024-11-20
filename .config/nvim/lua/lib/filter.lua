---filter table<a> to table<a>
---@param fn function(a):a
---@param tlb table
---@return table
local filter = function (fn, tlb)
  assert(type(fn) == "function", "fn: function")
  assert(type(tlb) == "table", "tlb: table(list)")

  local ret = {}

  for _, v in ipairs(tlb) do
    if fn(v) then
      table.insert(ret, v)
    end
  end

  return ret
end

return filter
