vim.pack.add({
  {
    src = "https://github.com/folke/snacks.nvim",
  },
  {
    src = "https://github.com/stevearc/oil.nvim",
  },
}, {
  confirm = false,
})

require("snacks").setup({
  picker = {
    enabled = true,
    layout = "ivy_split",
    win = {
      input = {
        b = {
          minicompletion_disable = true,
        },
      },
    },
  },
  image = {
    enabled = true,
  },
})

require("oil").setup({
  default_file_explorer = true,
})

vim.keymap.set("n", "<leader>f", function()
  require("snacks").picker.files()
end, {
  desc = "Find files",
})

vim.keymap.set("n", "<leader>h", function()
  require("snacks").picker.grep()
end, {
  desc = "Find files",
})

vim.keymap.set("n", "-", function()
  require("oil").open()
end, {
  desc = "Open parent directory",
})

vim.keymap.set("n", "<leader>d", function()
  require("oil").open()
end, {
  desc = "Open directory",
})
