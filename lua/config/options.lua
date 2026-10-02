vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options now provided by mini.basics (see lua/plugins/mini.lua) are commented
-- out below, grouped at the bottom with the reason.
local options = {
  relativenumber = true, -- kept: mini.basics only sets 'number'
  clipboard = "unnamedplus", -- kept: mini.basics uses `gp`/`gy` mappings instead
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  termguicolors = true,
  updatetime = 250,
  timeoutlen = 300,

  -- Provided by mini.basics — re-enable here only if you drop mini.basics:
  -- number = true,
  -- mouse = "a",
  -- breakindent = true, -- plus 'linebreak' on, 'wrap' off
  -- smartindent = true,
  -- ignorecase = true,
  -- smartcase = true,
  -- signcolumn = "yes",
  -- splitbelow = true,
  -- splitright = true,
  -- undofile = true,
}

for name, value in pairs(options) do
  vim.opt[name] = value
end
