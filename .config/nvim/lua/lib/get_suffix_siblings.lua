local file_exists = require("custom.lib.file_exists")
local map = require("custom.lib.map")
local slice = require("custom.lib.slice")
local every = require("custom.lib.every")
local is_equal = require("custom.lib.is_equal")
local some     = require("custom.lib.some")

---주어진 infixes 를 기반으로 infix 가 없는 경우를 포함하여 존재하는 파일 목록을 리턴
---TODO: infix 가 여러개인 경우도 존재함 i.g. android.www
---@param infixes table(string) filepath
---@param path string filepath
---@return table|nil
local get_suffix_siblings = function(infixes, suffixes, path)
  local dirname = vim.fs.dirname(path)
  local filename = vim.fs.basename(path)
  local parts = vim.split(filename, '%.')

  if #parts <= 1 then
    return vim.notify(string.format("invalid filename %s", filename), vim.log.levels.DEBUG)
  end

  local prefix = parts[1]
  local suffix = parts[#parts]

  if not some(is_equal(suffix), suffixes) then
    return vim.notify(string.format("unsupported file ext %s", suffix), vim.log.levels.DEBUG)
  end

  local siblings = {}
  local files = map(vim.fs.basename, vim.fn.glob(dirname .. "/*." .. suffix, false, true))

  for _, f in ipairs(files) do
    if f ~= filename then
      local _parts = vim.split(f, "%.")
      if prefix == _parts[1] then
        if #_parts == 2 then
          table.insert(siblings, f)
        elseif #_parts >= 3 then
          local _infixes = slice(2, #_parts - 1, _parts)
          if every(function (_i) return some(is_equal(_i), infixes) end, _infixes) then
            table.insert(siblings, f)
          end
        end
      end
    end
  end

  if #siblings == 0 then
    return
  end

  local with_dir = function(file)
    return string.format("%s/%s", dirname, file)
  end

  return map(with_dir, siblings)
end

return get_suffix_siblings
