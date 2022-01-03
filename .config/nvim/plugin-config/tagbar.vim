augroup tagbar_vimwiki
  autocmd BufRead,BufNewFile *.md TagbarOpen
  autocmd VimLeavePre *.md TagbarClose
augroup END

set tags+=~/workspace/src/github.com/deptno/deptno.github.io.wiki
set tags+=~/workspace/src/github.com/deptno/wiki

let g:tagbar_type_vimwiki = {
  \ 'ctagstype'	: 'markdown',
  \ 'kinds'		: [
    \ 'c:.1:0:0',
    \ 's:.2:0:1',
    \ 'S:.3:0:1',
    \ 't:.4:0:1',
    \ 'T:.5:0:1',
    \ 'u:.6:0:1',
  \ ],
  \ 'sro'			: '""',
  \ 'kind2scope'	: {
    \ 'c' : 'chapter',
    \ 's' : 'section',
    \ 'S' : 'subsection',
    \ 't' : 'subsubsection',
    \ 'T' : 'l4subsection',
  \ },
  \ 'scope2kind'	: {
    \ 'chapter' : 'c',
    \ 'section' : 's',
    \ 'subsection' : 'S',
    \ 'subsubsection' : 't',
    \ 'l4subsection' : 'T',
  \ },
  \ 'sort': 0,
\ }
