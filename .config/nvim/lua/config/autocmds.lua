-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local open_fx_file = function()
  local filename = vim.fn.expand("%:p")
  local command = string.format(
    [[
      tmux display-popup \
      -d "#{pane_current_path}" \
      -w 70%% \
      -h 100%% \
      -x 100%% \
      -e FX_THEME=6 \
      -EE 'cat %s | fx . | fx']],
    filename
  )
  vim.notify(command)

  vim.fn.system(command)
end

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("fx", {}),
  pattern = {
    "json",
    "yaml",
  },
  callback = function(event)
    vim.schedule(function()
      vim.keymap.set("n", ";v", open_fx_file, {
        buffer = event.buf,
        desc = "open file with fx",
      })
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("peek", {}),
  pattern = {
    "markdown",
    "vimwiki",
  },
  callback = function(event)
    vim.schedule(function()
      local handler = function()
        local peek = require("peek")

        if peek.is_open() then
          peek.close()
        else
          peek.open()
        end
      end

      vim.keymap.set("n", ";v", handler, {
        buffer = event.buf,
      })
    end)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("nospell", {}),
  pattern = {
    "markdown",
    "vimwiki",
  },
  callback = function(event)
    vim.opt.spell = false
  end,
})
