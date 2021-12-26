" neovim issue
" https://github.com/ludovicchabant/vim-gutentags/issues/269
" https://github.com/yuriteixeira/dotfiles/commit/69b8ea77d7a4c413172f4f04a27a42c51af4cef3
 let g:gutentags_enabled = 0
 augroup auto_gutentags
   au FileType json,yml,yaml,css,html,svg,js,javascript,ts,typescript,vim,vimwiki,rs let g:gutentags_enabled=1
 augroup end
