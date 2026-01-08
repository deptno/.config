---is_equal curring (x) => (y) => x == y
---@param v any
---@return function (yy) => boolean
local is_equal = function (v)
  return function(vv)
    return vv == v
  end
end

return is_equal
