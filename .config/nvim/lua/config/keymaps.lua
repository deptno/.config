-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local get_git_root = require("lib/get_git_root")

local open_lazygit = function()
  local git_root = get_git_root(vim.fn.expand("%:p:h"))
  local work_tree_option = git_root and "-w " .. git_root or ""
  vim.notify(work_tree_option)
  local command = string.format(
    [[
      tmux display-popup \
      -d "#{pane_current_path}" \
      -w 94%% \
      -h 100%% \
      -x 100%% \
      -EE "lazygit -ucf ~/.config/lazygit/neovim/config.yml %s"]],
    work_tree_option
  )
  vim.fn.system(command)
end
local open_lazygit_commits = function()
  local current_dir = vim.fn.expand("%:p:h")
  local git_root = get_git_root(current_dir)
  local work_tree_option = git_root and "-w " .. git_root or ""
  vim.notify(work_tree_option)
  local command = string.format(
    [[
      tmux display-popup \
      -d "#{pane_current_path}" \
      -w 94%% \
      -h 100%% \
      -x 100%% \
      -EE "lazygit -ucf ~/.config/lazygit/neovim/config.yml %s --filter %s/"]],
    work_tree_option,
    current_dir
  )
  vim.fn.system(command)
end
local open_lazygit_commits_for_current_file = function()
  local git_root = get_git_root(vim.fn.expand("%:p:h"))
  local work_tree_option = git_root and "-w " .. git_root or ""
  vim.notify(work_tree_option)
  local command = string.format(
    [[
      tmux display-popup \
      -d "#{pane_current_path}" \
      -w 94%% \
      -h 100%% \
      -x 100%% \
      -EE "lazygit -ucf ~/.config/lazygit/neovim/config.yml %s --filter %s"]],
    work_tree_option,
    vim.api.nvim_buf_get_name(0)
  )
  vim.fn.system(command)
end

map("n", "lz", open_lazygit, { desc = "Lazygit" })
map("n", "lz,", open_lazygit_commits, { desc = "Lazygit: Commits" })
map("n", "lz.", open_lazygit_commits_for_current_file, { desc = "Lazygit: Commits for current file" })
