if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'cohama/lexima.vim'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'voldikss/vim-floaterm'
Plug 'mhinz/vim-startify'
Plug 'preservim/tagbar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tools-life/taskwiki'
Plug 'itchyny/vim-gitbranch'
Plug 'rust-lang/rust.vim'
Plug 'itchyny/vim-cursorword'
Plug 'frazrepo/vim-rainbow'
Plug 'tools-life/taskwiki'

if has("nvim")
  " font
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'yamatsum/nvim-nonicons'
  Plug 'kristijanhusak/defx-icons'

  " statusline
  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

  Plug 'kristijanhusak/defx-git'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'Yggdroot/indentLine'
  Plug 'skywind3000/vim-quickui'
  Plug 'ElPiloto/telescope-vimwiki.nvim'
  Plug 'github/copilot.vim'
endif

call plug#end()

if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

runtime! plugin-config/*.vim
runtime! plugin-config/*.lua
