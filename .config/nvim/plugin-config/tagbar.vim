augroup tagbar_vimwiki
  autocmd BufRead,BufNewFile *.md TagbarOpen
  autocmd VimLeavePre *.md TagbarClose
augroup END

set tags+=~/workspace/src/github.com/deptno/deptno.github.io.wiki
set tags+=~/workspace/src/github.com/deptno/wiki

let g:tagbar_type_vimwiki = {
        \ 'ctagstype' : 'markdown',
				\ 'kinds'     : [
				\     'c:h1:0:0',
				\     's:h2:0:0',
				\     'S:h3:0:0',
				\     't:h4:0:0',
				\     'T:h5:0:0',
				\     'u:h6:0:0',
				\ ],
				\ 'sro'        : '::',
				\ 'kind2scope' : {
				\     'a' : 'h1',
				\     'b' : 'h2',
				\     'c' : 'h3',
				\     'd' : 'h4',
				\     'e' : 'h5',
				\     'f' : 'h6',
				\ },
				\ 'scope2kind' : {
				\     'h1' : 'a',
				\     'h2' : 'b',
				\     'h3' : 'c',
				\     'h4' : 'd',
				\     'h5' : 'e',
				\     'h6' : 'f',
				\}
				\}
