---every fn(all each items) == true
---@param fn function(a):b
---@param tlb table
---@return boolean
local some = function (fn, tlb)
  assert(type(fn) == "function", "fn: function")
  assert(type(tlb) == "table", "tlb: table(list)")

  local ret = {}

  for _, v in ipairs(tlb) do
    if not fn(v) then
      return false
    end
  end

  return true
end

return some
