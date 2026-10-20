vim.pack.add({
  {
    src = "https://github.com/lewis6991/gitsigns.nvim",
  },
  {
    src = "https://github.com/NeogitOrg/neogit",
  },
}, {
  confirm = false,
})

require("gitsigns").setup({
  signcolumn = true,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 500,
  },
})

require("neogit").setup({})

vim.keymap.set("n", "<leader>g", function()
  require("neogit").open()
end, {
  desc = "Open Git status",
})
