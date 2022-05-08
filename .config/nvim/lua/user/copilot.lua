vim.cmd "highlight CopilotSuggestion guifg=#50fa7b ctermfg=8"
local opts = { script = true, silent = true, expr = true }
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<cr>")', opts)
vim.cmd "let g:copilot_no_tab_map = v:true"
vim.cmd "let g:copilot_assume_mapped = v:true"
vim.cmd "highlight CopilotSuggestion guifg=#555555 ctermfg=8"
vim.g.copilot_filetypes = {
  ["vimwiki"] = false,
  ["org"] = false
}
