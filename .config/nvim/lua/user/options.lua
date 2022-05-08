vim.opt.backup = false
vim.opt.cmdheight = 1
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.showtabline = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.timeoutlen = 200
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.writebackup = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.guifont = "monospace:h17"
vim.opt.inccommand = "split"

-- emoji 등 유니코드 캐릭터가 존재한 이후에는 yy 등 카피가 clipboard(reg *) 에 복사되지 않는 이슈
-- https://github.com/neovim/neovim/issues/11432#issuecomment-557868656
vim.cmd ":let $LANG='en_US.UTF-8'"
vim.cmd "set clipboard^=unnamed,unnamedplus"
vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd "set iskeyword-=-"
--
--vim.opt.colorscheme = dracula
vim.cmd [[
try
  colorscheme dracula
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

vim.cmd "highlight CursorLine ctermbg=255 guibg=#333333"

-- vim.cmd "command Webstorm :!open -a webstorm %:p"
vim.cmd [[
command -complete=shellcmd -nargs=1 Open :!open -a <args> %:p
]]

-- fix: workaround `Vim:E117: Unknown function: netrw#CheckIfRemote`
-- https://github.com/tpope/vim-fugitive/issues/594#issuecomment-75315088
vim.cmd [[
if !exists('g:loaded_netrw')
  runtime! autoload/netrw.vim
endif
]]

