" let g:tagbar_type_markdown = {
"     \ 'ctagstype' : 'markdown',
"     \ 'kinds' : [
"             \ 'h:headings',
"             \ 'l:links',
"             \ 'i:images'
"         \ ],
"     \ "sort" : 0
" \ }
" let g:tagbar_type_vimwiki = {
"     \ 'ctagstype' : 'markdown',
" \ }
" 
"

augroup tagbar_vimwiki
  autocmd BufRead,BufNewFile *.md TagbarOpen
  autocmd VimLeavePre *.md TagbarClose
augroup END

set tags+=~/workspace/src/github.com/deptno/deptno.github.io.wiki
set tags+=~/workspace/src/github.com/deptno/wiki
