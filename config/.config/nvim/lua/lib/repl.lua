local run_lua = function (code)
  local sandbox = string.format([[
do
  %s
end
]], code)
  local chunk = load(sandbox)

  return pcall(chunk)
end
local run_js = function (code)
  local result = vim.fn.system(string.format('bun repl -e "%s"', code))

  return 0, result
end

local run_by_filetype = function (filetype, code)
  if
    filetype == 'typescript'
    or filetype == 'typescriptreact'
    or filetype == 'javascript'
    or filetype == 'javascriptreact'
  then
    return run_js(code)
  else
    return run_lua(code)
  end
end

local notify_result = vim.schedule_wrap(function (lang, code)
  local success, result = run_by_filetype(lang, code)
  local level = success and vim.log.levels.INFO or vim.log.levels.ERROR

  if type(result) == 'table' then
    result = vim.inspect(result)
  end

  vim.notify(tostring(result), level)
end)

local run_code = vim.schedule_wrap(function(title, code)
  local filetype = vim.bo.filetype

  vim.notify(code, vim.log.levels.INFO, {
    title = string.format("%s %s", title, filetype),
    on_open = function (win)
      local buf = vim.api.nvim_win_get_buf(win)

      vim.api.nvim_buf_set_option(buf, "filetype", filetype)

      notify_result(filetype, code)
    end
  })
end)

local run = function (code)
  run_code('Run', code)
end
local evaluate = function (code)
  run_code('Evaluate', code)
end

return {
  run = run,
  evaluate = evaluate,
}
