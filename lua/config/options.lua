vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local options = {
  number = true,
  relativenumber = true,
  undofile = true,
  background = "dark",
  termguicolors = true,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  softtabstop = 2,
  smartindent = true,
  ignorecase = true,
  smartcase = true,
  wrap = false,
  signcolumn = "yes",
  showtabline = 0,
  scrolloff = 8,
  cursorline = true,
  splitright = true,
  splitbelow = true,
  swapfile = false,
  clipboard = "unnamedplus",
  updatetime = 250,
  completeopt = "menu,menuone,noselect,popup",
}

for name, value in pairs(options) do
  vim.opt[name] = value
end
