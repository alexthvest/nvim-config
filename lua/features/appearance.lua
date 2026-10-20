vim.pack.add({
  {
    src = "https://github.com/oxidescheme/nvim",
    name = "oxide",
  },
  {
    src = "https://github.com/sschleemilch/slimline.nvim",
  },
}, {
  confirm = false,
})

vim.cmd.colorscheme("oxide")

require("slimline").setup({
  style = "fg",
  components = {
    left = {
      "mode",
      "path",
      "git",
    },
    right = {
      "diagnostics",
    },
  },
})
