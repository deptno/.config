local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
keymap("n", "cd", ":cd %:h | pwd<cr>", opts)
keymap("n", "cd-", ":cd - | pwd<cr>", opts)
keymap("n", "sw", ":set wrap!<cr>", opts)
keymap("n", ";dt", 'a<space><esc>"=strftime("%Y-%m-%d %T")<cr>P', opts)
keymap("n", ";dd", 'a<space><esc>"=strftime("%Y-%m-%d")<cr>P', opts)
keymap("n", "tt", "tabnew<cr>", opts)
keymap("n", ";w", ":setlocal wrap!<cr>", opts)
-- rest
keymap("n", ";rr", "<plug>RestNvim", {})
keymap("n", ";rp", "<plug>RestNvimPreview", {})
keymap("n", ";rl", "<plug>RestNvimLast", {})
-- nvim-tree
keymap("n", "sf",     ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Telescope
keymap("n", ';f', '<cmd>Telescope find_files<cr>', opts)
keymap("n", ';g', '<cmd>Telescope live_grep<cr>', opts)
keymap("n", ';b', '<cmd>Telescope buffers<cr>', opts)
keymap("n", ';t', '<cmd>Telescope<cr>', opts)

-- Telescope
keymap("n", '-p', '<cmd>MarkdownPreview<cr>', opts)

-- Insert --

-- Visual --
-- Stay in indent mode
keymap("v", "p", '"_dP', opts)
