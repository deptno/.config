return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {
          filetypes = {
            "markdown",
            "markdown.mdx",
            "vimwiki",
          },
        },
      },
    },
  },
}
