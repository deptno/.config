local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return print 'error: load lspconfig'
end

require 'user.lsp.lsp-installer'
require 'user.lsp.handlers'.setup()
require 'user.lsp.null-ls'

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
