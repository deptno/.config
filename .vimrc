" plugin
call plug#begin('~/.config/plugged')

" looks
Plug 'KeitaNakamura/neodark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" editing
Plug 'tpope/vim-surround'
" typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

call plug#end()

" global config
set tabstop=2 shiftwidth=2 expandtab
set number
set clipboard=unnamed

" color
colorscheme neodark

" syntax highlight
"autocmd FileType typescript :set makeprg=tsc
