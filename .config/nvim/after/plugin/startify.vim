" https://github.com/mhinz/vim-startify/wiki/Example-configurations
"
let g:startify_show_help = 1
let g:startify_show_help_delay = 1
let g:startify_show_help_delay_interval = 0.1

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
      \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_bookmarks = [
      \ '~/.zshrc',
      \ '~/.tmux.conf',
      \ '~/.taskrc',
      \ '~/.config/nvim/init.vim',
      \ '~/.config/nvim/plugin.vim',
      \ '~/.gitconfig',
      \ '~/.gitignore',
      \ '~/.gitignore_global',
      \ ]

function! GetUniqueSessionName()
  let path = fnamemodify(getcwd(), ':~:t')
  let path = empty(path) ? 'no-project' : path
  let branch = gitbranch#name()
  let branch = empty(branch) ? '' : '-' . branch
  return substitute(path . branch, '/', '-', 'g')
endfunction

" 자동 세션 처리
" autocmd User        StartifyReady silent execute 'SLoad '  . GetUniqueSessionName()
" autocmd VimLeavePre *             silent execute 'SSave! ' . GetUniqueSessionName()
command! StartifySaveBranchSession ':SSave! ' . GetUniqueSessionName()
command! StartifyLoadBranchSession ':SLoad ' . GetUniqueSessionName()

nnoremap <silent> ;s :Startify<CR>
