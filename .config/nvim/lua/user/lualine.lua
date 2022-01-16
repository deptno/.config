local theme = require'lualine.themes.horizon'

require('lualine').setup {
  options = { theme = theme },
  sections = {
    lualine_c = {
      'lsp_progress'
    }
  }
}
