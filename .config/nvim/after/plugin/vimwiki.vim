" 로컬 리더 키 설정은 취향이니 각자 마음에 드는 키로 설정한다
let maplocalleader = "\\"

"1번 위키(공개용)와 2번 위키(개인용)
let g:vimwiki_list = [
    \{
    \   'path': '~/workspace/src/github.com/deptno/deptno.github.io.wiki',
    \   'ext' : '.md',
    \   'diary_rel_path': 'diary',
    \   'diary_index': 'index',
    \},
    \{
    \   'path': '~/workspace/src/github.com/deptno/wiki',
    \   'ext' : '.md',
    \   'diary_rel_path': 'diary',
    \   'diary_index': 'index',
    \},
\]

" vimwiki의 conceallevel 을 끄는 쪽이 좋다
" let g:vimwiki_conceallevel = 1

command! WikiIndex :VimwikiIndex
nmap <LocalLeader>wi <Plug>VimwikiDiaryIndex
nmap <LocalLeader>w<LocalLeader>w <Plug>VimwikiMakeDiaryNote
nmap <LocalLeader>wt :VimwikiTable<CR>

" F4 키를 누르면 커서가 놓인 단어를 위키에서 검색한다.
nnoremap <F4> :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>

" Shift F4 키를 누르면 현재 문서를 링크한 모든 서를 검색한다
nnoremap <S-F4> :execute "VWB" <Bar> :lopen<CR>문

autocmd FileType vimwiki nmap <S-x> <Plug>VimwikiToggleListItemj

set path+=~/workspace/src/github.com/deptno/deptno.github.io.wiki
set path+=~/workspace/src/github.com/deptno/wiki

set syntax=markdown
