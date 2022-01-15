local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  return print 'restart neovim'
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local ok, packer = pcall(require, "packer")

if not ok then
  return print "error: packer load"
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

packer.startup(function(use)
  use "wbthomason/packer.nvim"
  -- wiki
  use { 'vimwiki/vimwiki', branch = 'dev' }
  -- typing
  use 'tpope/vim-surround'
  -- theme
  use "dracula/vim"
  -- file explorer
  use {
    'Shougo/defx.nvim',
    requires = {
      'kristijanhusak/defx-icons',
      'kristijanhusak/defx-git',
      'kyazdani42/nvim-web-devicons',
      'yamatsum/nvim-nonicons',
    },
    run = ':UpdateRemotePlugins'
  }
  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'tamago324/nlsp-settings.nvim'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- git
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-fugitive'
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }
  -- code assist
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
    },
  }
  use 'github/copilot.vim'
  -- startup
  use { 'mhinz/vim-startify' }
  -- tagbar
  use { 'preservim/tagbar' }
  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- telescope
  use 'nvim-telescope/telescope.nvim'

  -- statusline
  -- use {
  --   glepnir/galaxyline.nvim',
  --   branch = 'main',
  --   requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  --   config = function()
  --     require'statusline'
  --   end,
  -- }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
