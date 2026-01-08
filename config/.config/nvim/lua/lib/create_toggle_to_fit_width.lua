-- TODO: signcolumn, number 고려 필요
local function create_toggle_to_fit_width(min_width)
  -- TODO: buf_cache 대신 nvim_buf_set_var 를 이용할 수 있을지
  local buf_cache = {}

  min_width = min_width or 30

  return function()
    local bufnr = vim.fn.bufnr()
    local lines = vim.fn.getbufline(bufnr, 1, '$')
    local buffer_width = min_width

    for _, v in ipairs(lines) do
      local line_width = vim.fn.strdisplaywidth(v)
      if line_width > buffer_width then
        buffer_width = line_width
      end
    end

    local current_width = vim.api.nvim_win_get_width(0)

    if
      current_width == buffer_width
      and buf_cache[bufnr]
      and buf_cache[bufnr] ~= current_width
    then
      vim.api.nvim_win_set_width(0, buf_cache[bufnr])
    else
      buf_cache[bufnr] = current_width
      vim.api.nvim_win_set_width(0, buffer_width)
    end
  end
end

return create_toggle_to_fit_width
