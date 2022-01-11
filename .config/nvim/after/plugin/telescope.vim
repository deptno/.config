if !exists('g:loaded_telescope') | finish | endif

nnoremap <silent> ;f <cmd>Telescope find_files<cr>
nnoremap <silent> ;r <cmd>Telescope live_grep<cr>
nnoremap <silent> \\ <cmd>Telescope buffers<cr>
nnoremap <silent> ;t <cmd>Telescope<cr>

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
    file_ignore_patterns = {"node_modules"}
  }
}
--- vimwiki
-- require('telescope').load_extension('vimwiki')
-- require('telescope').load_extension('vw')
EOF
