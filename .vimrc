" plugin
call plug#begin('~/.config/plugged')

" color
Plug 'KeitaNakamura/neodark.vim'
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
autocmd FileType typescript :set makeprg=tsc
