local ok, nvimtree = pcall(require, 'nvim-tree')

if not ok then
  return print 'nvim-tree is not loaded'
end

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
  { key = {"<CR>", "o", "<2-LeftMouse>", "l"}, cb = tree_cb("edit") },
  { key = {"<2-RightMouse>", "<C-]>"},         cb = tree_cb("cd") },
  { key = "<C-v>",                             cb = tree_cb("vsplit") },
  { key = "<C-x>",                             cb = tree_cb("split") },
  { key = "<C-t>",                             cb = tree_cb("tabnew") },
  { key = "<",                                 cb = tree_cb("prev_sibling") },
  { key = ">",                                 cb = tree_cb("next_sibling") },
  { key = "P",                                 cb = tree_cb("parent_node") },
  { key = { "<BS>", "h" },                     cb = tree_cb("close_node") },
  { key = "<Tab>",                             cb = tree_cb("preview") },
  { key = "K",                                 cb = tree_cb("first_sibling") },
  { key = "J",                                 cb = tree_cb("last_sibling") },
  { key = "I",                                 cb = tree_cb("toggle_ignored") },
  { key = "H",                                 cb = tree_cb("toggle_dotfiles") },
  { key = "R",                                 cb = tree_cb("refresh") },
  { key = "a",                                 cb = tree_cb("create") },
  { key = "d",                                 cb = tree_cb("remove") },
  { key = "D",                                 cb = tree_cb("trash") },
  { key = "r",                                 cb = tree_cb("rename") },
  { key = "<C-r>",                             cb = tree_cb("full_rename") },
  { key = "x",                                 cb = tree_cb("cut") },
  { key = "c",                                 cb = tree_cb("copy") },
  { key = "p",                                 cb = tree_cb("paste") },
  { key = "y",                                 cb = tree_cb("copy_name") },
  { key = "Y",                                 cb = tree_cb("copy_path") },
  { key = "gy",                                cb = tree_cb("copy_absolute_path") },
  { key = "[c",                                cb = tree_cb("prev_git_item") },
  { key = "]c",                                cb = tree_cb("next_git_item") },
  { key = "-",                                 cb = tree_cb("dir_up") },
  { key = "s",                                 cb = tree_cb("system_open") },
  { key = "q",                                 cb = tree_cb("close") },
  { key = "g?",                                cb = tree_cb("toggle_help") },
}

nvimtree.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  hijack_directories   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 80,
    -- height = 30,
    hide_root_folder = false,
    side = 'left',
    mappings = {
     custom_only = false,
      list = list,
    },
    number = true,
    relativenumber = true,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  },
  actions = {
    open_file = {
      resize_window = false,
    }
  }
}
