local get_suffix_siblings = require('custom/lib/get_suffix_siblings')
local get_git_root        = require('custom/lib/get_git_root')

---
---@param infixes table infix(string) list
---@param suffixes table suffix(string) list
---
local select_react_native_siblings = function (infixes, suffixes )
  local filepath = vim.fn.expand('%')
  local siblings = get_suffix_siblings(infixes, suffixes, filepath)

  if siblings then
    if #siblings > 0 then
      local filename = vim.fn.expand('%')
      local git_root, ok = get_git_root(vim.fs.dirname(filename))

      if ok == 'ok' then
        filename = filename:sub(#git_root + 1)
      else
        filename = vim.fn.fnamemodify(filename, ':~')
      end

      vim.ui.select(
        siblings,
        {
          prompt = string.format('Select sibling of %s:', filename),
          format_item = function (item)
            return string.format('%s', vim.fs.basename(item))
          end
        },
        function(item)
          if item then
            vim.cmd(string.format('edit %s', item))
          end
        end
      )
    end
  end
end

return select_react_native_siblings
