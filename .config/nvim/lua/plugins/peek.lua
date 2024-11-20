return {
  "toppair/peek.nvim",
  build = "deno task --quiet build:fast",
  config = function()
    require("peek").setup({
      filetype = {
        "markdown",
        "vimwiki",
      },
      theme = "light",
    })

    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  end,
  event = {
    "VeryLazy",
  },
}
