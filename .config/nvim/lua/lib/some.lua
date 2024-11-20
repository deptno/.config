---some atleast one item meets fn(item) == true
---@param fn function(a):b
---@param tlb table
---@return boolean
local some = function (fn, tlb)
  assert(type(fn) == "function", "fn: function")
  assert(type(tlb) == "table", "tlb: table(list)")

  local ret = {}

  for _, v in ipairs(tlb) do
    if fn(v) then
      return true
    end
  end

  return false
end

return some
