if has("win32")
  let s:clip = '/mnt/c/Windows/System32/clip.exe'
  if executable(s:clip)
    augroup WSLYank
      autocmd!
      autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
    augroup END
  end
endif
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
    runtime ~/.config/nvim/macos.vim
  endif
endif
