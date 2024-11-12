-- https://github.com/deptno/.config/blob/0b2f235e2a3452fb6043f4e607a6bf1968804030/.config/nvim/lua/user/vimwiki.lua
vim.g.vimwiki_auto_chdir = 1
vim.g.vimwiki_conceallevel = 0
vim.g.vimwiki_global_ext = 0
vim.g.vimwiki_start_week_day = "sunday"
vim.g.vimwiki_list = {
  {
    name = "public",
    path = "~/workspace/src/github.com/deptno/public-wiki",
    ext = ".md",
    diary_rel_path = "diary",
    diary_index = "index",
    auto_diary_index = 1,
  },
  {
    name = "private",
    path = "~/workspace/src/github.com/deptno/wiki",
    ext = ".md",
    diary_rel_path = "diary",
    diary_index = "index",
    auto_diary_index = 1,
  },
  {
    name = "career",
    path = "~/workspace/src/github.com/deptno/wiki-career",
    ext = ".md",
    diary_rel_path = "diary",
    diary_index = "index",
    auto_diary_index = 1,
  },
}
vim.treesitter.language.register("markdown", "vimwiki")

return {
  "vimwiki/vimwiki",
  ft = {
    "markdown",
  },
  keys = {
    {
      "<leader>ww",
      mode = "n",
      desc = "Vimwiki index",
    },
    {
      "<leader>w<leader>w",
      mode = "n",
      desc = "Vimwiki diary",
    },
    {
      "<S-x>",
      "<Plug>VimwikiToggleListItemj",
      mode = "n",
      desc = "vimwiki toggle checkbox",
    },
    {
      "L",
      "<Plug>VimwikiDiaryNextDay",
    },
    {
      "H",
      "<Plug>VimwikiDiaryPrevDay",
    },
    {
      "<S-x>",
      "<Plug>VimwikiToggleListItemj",
    },
    {
      "tt",
      "<cmd>VimwikiTable<CR>",
    },
    {
      ";b",
      "<cmd>execute 'VWB' <Bar> :lopen<CR>",
    },
    {
      ";v",
      function()
        vim.notify("TODO: preview markdown")
      end,
    },
  },
}
