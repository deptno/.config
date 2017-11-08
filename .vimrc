" plugins
call plug#begin('~/.config/plugged')

" syntax
Plug 'w0rp/ale'
" browsing
Plug 'scrooloose/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
" editing
Plug 'tpope/vim-surround' " language
Plug 'sheerun/vim-polyglot'
" language typescript
Plug 'Quramy/tsuquyomi'
" http
Plug 'diepm/vim-rest-console'
" looks (may need lazy load)
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" global config
set tabstop=2 shiftwidth=2 expandtab
set number
set clipboard=unnamed

" color
colorscheme neodark
" ale
let g:ale_linters = {
  \   'typescript': ['tsserver'],
  \}
" tsuquyomi
let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript nmap <buffer> <Leader>e <Plug>(TsuquyomiRenameSymbol)
autocmd FileType typescript nmap <buffer> <Leader>E <Plug>(TsuquyomiRenameSymbolC)
autocmd FileType typescript nmap <buffer> K : <C-u>echo tsuquyomi#hint()<CR>
autocmd FileType typescript nmap <buffer> <Leader>i <Plug>(TsuquyomiImport)
" nerdtree
map <Leader>1 :NERDTreeToggle<CR>

" fzf"
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \}

