vim.cmd "autocmd FileType lspinfo nnoremap q :q<cr>"
vim.cmd "autocmd FileType help nnoremap q :q<cr>"
vim.cmd "autocmd FileType qf nnoremap q :q<cr>"
-- @todo clipboard 사용을 위한 코드, 미확인 
-- vim.cmd "autocmd TextYankPost * call system(\"pbcopy\", @\")"
