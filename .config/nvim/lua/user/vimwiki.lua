vim.g.maplocalleader = '\\'
vim.g.vimwiki_auto_chdir = 1
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

vim.cmd "autocmd FileType vimwiki nmap <S-x> <Plug>VimwikiToggleListItemj"
