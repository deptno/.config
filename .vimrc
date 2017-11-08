" plugins
call plug#begin('~/.config/plugged')

" looks
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" editing
Plug 'tpope/vim-surround'
" language
Plug 'sheerun/vim-polyglot'
" typescript
Plug 'Quramy/tsuquyomi'

call plug#end()

" global config
set tabstop=2 shiftwidth=2 expandtab
set number
set clipboard=unnamed

" color
colorscheme neodark

" ale
" use tsuquyomi
let g:ale_linters = {
      \   'typescript': ['tsserver'],
      \}
