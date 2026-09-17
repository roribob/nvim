vim.g.mapleader = " "
vim.g.maplocalleader = " "

local options = {
  number = true,
  relativenumber = true,
  mouse = "a",
  breakindent = true,
  clipboard = "unnamedplus",
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  smartindent = true,
  ignorecase = true,
  smartcase = true,
  signcolumn = "yes",
  splitbelow = true,
  splitright = true,
  termguicolors = true,
  undofile = true,
  updatetime = 250,
  timeoutlen = 300,
}

for name, value in pairs(options) do
  vim.opt[name] = value
end
