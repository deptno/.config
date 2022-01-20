vim.g.vimwiki_auto_chdir = 1
vim.g.vimwiki_conceallevel = 0
vim.g.vimwiki_list = {
  {
    path = '~/workspace/src/github.com/deptno/deptno.github.io.wiki',
    ext  = '.md',
    diary_rel_path = 'diary',
    diary_index = 'index',
  },
  {
    path = '~/workspace/src/github.com/deptno/wiki',
    ext  = '.md',
    diary_rel_path = 'diary',
    diary_index = 'index',
  },
}

vim.cmd [[
augroup vimwiki_keymap
  autocmd!
  autocmd FileType vimwiki nmap <S-x> <Plug>VimwikiToggleListItemj
"  autocmd FileType vimwiki nnoremap <LocalLeader>wi <Plug>VimwikiDiaryIndex
"  autocmd FileType vimwiki nnoremap <LocalLeader>w<LocalLeader>w <Plug>VimwikiMakeDiaryNote"
  autocmd FileType vimwiki nnoremap <LocalLeader>wt :VimwikiTable<CR>
  autocmd FileType vimwiki nnoremap gr :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>
  autocmd FileType vimwiki nnoremap gk :execute "VWB" <Bar> :lopen<CR>
  autocmd BufEnter *.md set syntax=markdown
augroup end
]]
