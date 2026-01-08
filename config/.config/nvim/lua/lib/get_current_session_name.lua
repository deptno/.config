local get_current_session_name = function ()
   return vim.fn.resolve(vim.fn.stdpath('data') .. '/session/__LAST__')
end

return get_current_session_name
