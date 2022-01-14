"     if has("nvim")
"       let g:plug_home = stdpath('data') . '/plugged'
"     endif
"     
     "call plug#begin()
"     
"     " theme
"     Plug 'arcticicestudio/nord-vim'
     "Plug 'dracula/vim'
"     
"     " git
     "Plug 'tpope/vim-fugitive'
     "Plug 'tpope/vim-rhubarb'
"     
"     " edit
     "Plug 'tpope/vim-surround'
     "Plug 'tpope/vim-unimpaired'
"     Plug 'cohama/lexima.vim'
"     
"     " visual
"     Plug 'frazrepo/vim-rainbow'
"     Plug 'itchyny/vim-cursorword'
"     
"     " wiki
     "Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
"     
"     " ui
"     Plug 'voldikss/vim-floaterm'
"     
"     " manage
     "Plug 'mhinz/vim-startify'
"     
"     " ux
     "Plug 'preservim/tagbar'
"     
"     " util
"     Plug 'ludovicchabant/vim-gutentags'
"     Plug 'itchyny/vim-gitbranch'
"     
"     
"     " Plug 'tools-life/taskwiki'
"     
     "if has("nvim")
"       " font
       "Plug 'kyazdani42/nvim-web-devicons'
       "Plug 'yamatsum/nvim-nonicons'
       "Plug 'kristijanhusak/defx-icons' "defx works with neovim
"     
"       " statusline
       "Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
"     
"       " file explorer
       "Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
       "Plug 'kristijanhusak/defx-git'
"     
"       " ui
"       Plug 'nvim-lua/popup.nvim'
"       Plug 'nvim-lua/plenary.nvim'
"     
"       " TODO: classify
"       Plug 'folke/lsp-colors.nvim'
"       Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
"       Plug 'nvim-telescope/telescope.nvim'
"       Plug 'Yggdroot/indentLine'
"       Plug 'skywind3000/vim-quickui'
"       Plug 'ElPiloto/telescope-vimwiki.nvim'
"       Plug 'github/copilot.vim'
"     
"       " snippet
"       Plug 'hrsh7th/vim-vsnip'
"     
"       " lsp config
       "Plug 'neovim/nvim-lspconfig'
"     
"       " completion
       "Plug 'hrsh7th/nvim-cmp'
"       Plug 'hrsh7th/cmp-nvim-lsp'
"       Plug 'hrsh7th/cmp-vsnip'
"       Plug 'hrsh7th/cmp-path'
"       Plug 'hrsh7th/cmp-buffer'
"       " Plug 'glepnir/lspsaga.nvim'
"     
"       " rust
       "Plug 'rust-lang/rust.vim'
       "Plug 'simrat39/rust-tools.nvim'
     "endif
"     
     "call plug#end()
     
if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin\n"
   runtime ./macos.vim
  endif
endif

runtime! after/plugin/*.vim
runtime! after/plugin/*.lua

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF

-- nvim_lsp object
local nvim_lsp = require'lspconfig'
EOF

lua <<EOF
require('rust-tools').setup({})
EOF

" Code navigation shortcuts
" as found in :help lsp
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

" Quick-fix
nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300
" Show diagnostic popup on cursor hover
autocmd CursorHold * lua vim.diagnostic.open_float()

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>
