local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return 'error: nvim-treesitter '
end

configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" },
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true,
    disable = { "org" },
    additional_vim_regex_highlighting = { "org" },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  indent = {
    enable = true,
    disable = { 'yaml' }
  }
}
