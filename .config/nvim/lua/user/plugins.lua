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
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
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
  }
  -- code assist
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-copilot',
      'L3MON4D3/LuaSnip',
    },
  }
  use {
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use 'github/copilot.vim'
  use 'windwp/nvim-autopairs'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'editorconfig/editorconfig-vim',
    config = function()
      vim.g.EditorConfig_exclude_patterns = { 'fugitive://.*', 'scp://.*' }
    end
  }
  use {
    'chentau/marks.nvim',
    config = function()
      require'marks'.setup {
        -- whether to map keybinds or not. default true
        default_mappings = false,
        -- which builtin marks to show. default {}
        builtin_marks = { ".", "<", ">", "^" },
        -- whether movements cycle back to the beginning/end of buffer. default true
        cyclic = true,
        -- whether the shada file is updated after modifying uppercase marks. default false
        force_write_shada = false,
        -- how often (in ms) to redraw signs/recompute mark positions. 
        -- higher values will have better performance but may cause visual lag, 
        -- while lower values may cause performance penalties. default 150.
        refresh_interval = 250,
        -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
        -- marks, and bookmarks.
        -- can be either a table with all/none of the keys, or a single number, in which case
        -- the priority applies to all marks.
        -- default 10.
        sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
        -- disables mark tracking for specific filetypes. default {}
        excluded_filetypes = {},
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        bookmark_0 = {
          sign = "⚑",
          virt_text = "hello world"
        },
        mappings = {
          delete_bookmark = "dm",
          set_next = "m/",
          next = "m.",
          prev = "m,",
          preview = "m;",
        },
      }
    end
  }
  
  -- startup
  use { 'mhinz/vim-startify' }
  -- tagbar
  use { 'preservim/tagbar' }
  -- treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- orgmode
  require('orgmode').setup_ts_grammar()
  use { 'nvim-orgmode/orgmode' }
  use { 'lukas-reineke/headlines.nvim' }
  use {
    "akinsho/org-bullets.nvim",
    config = function()
      require("org-bullets").setup {
        symbols = { "◉", "○", "✸", "✿" },
      }
    end
  }
  use {
    "michaelb/sniprun",
    run = "bash install.sh",
  }
  -- telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'ElPiloto/telescope-vimwiki.nvim'
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'arkav/lualine-lsp-progress',
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
  use {
    'danilamihailov/beacon.nvim',
    config = function()
      vim.cmd [[
let g:beacon_size = 60
let g:beacon_shrink = 0
let g:beacon_timeout = 2000
      ]]
    end
  }
  -- rest
  use {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end
  }
  -- rust
  use {
    'simrat39/rust-tools.nvim',
    config = function()
      require('rust-tools').setup({})
    end,
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
