vim.pack.add({
  {
    src = "https://github.com/nvim-mini/mini.pairs",
    version = "stable",
  },
  {
    src = "https://github.com/nvim-mini/mini.completion",
    version = "stable",
  },
  {
    src = "https://github.com/nvim-mini/mini.keymap",
    version = "stable",
  },
}, {
  confirm = false,
})

require("mini.pairs").setup({
  modes = {
    insert = true,
    command = false,
    terminal = false,
  },
})

require("mini.keymap").setup()
require("mini.completion").setup({
  delay = {
    completion = 100,
    info = 100,
    signature = 50,
  },
})

local map_multistep = require("mini.keymap").map_multistep

map_multistep({
  "i",
  "s",
}, "<Tab>", {
  "vimsnippet_next",
  "pmenu_next",
})

map_multistep({
  "i",
  "s",
}, "<S-Tab>", {
  "vimsnippet_prev",
  "pmenu_prev",
})

map_multistep("i", "<CR>", {
  "pmenu_accept",
  "minipairs_cr",
})

map_multistep("i", "<BS>", {
  "minipairs_bs",
})
