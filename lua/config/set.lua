local undo_dir = vim.fn.stdpath("cache") .. "/undo/"
-- Creates the directory we are going to use for undo tracking
vim.fn.mkdir(undo_dir, "p")
-- Use the directory we created earlier to store our undo delta
vim.opt.undodir = undo_dir
-- Tells vim to keep track of changes made in a delta file so I can undo
-- file changes even after closing my neovim instance and reopening it
vim.opt.undofile = true
-- How many changes do we keep track of?
vim.opt.undolevels = 1000

vim.g.mapleader = " "
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.mouse = "a"
vim.opt.wrap = true
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.wrap = true
vim.opt.foldenable = true
-- fold by indent. Since indents are now consistent (see above), this allows for consistent folding
vim.opt.foldmethod = "indent"
-- how many folds are we willing to do within a fold before we just stop folding
vim.opt.foldlevel = 99
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.scrolloff = 10
vim.opt.updatetime = 50
vim.opt.autoread = true
vim.opt.exrc = true
vim.opt.secure = true
-- ignore case when searching/replacing
vim.opt.ignorecase = true
-- Show my substitutions in the buffer as I type them. Super great for visually seeing what I am about to do
vim.opt.incsearch = true
-- Tells the host term to enable 24bit color instead of 8
vim.opt.termguicolors = true
vim.opt.laststatus = 3

-- vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
--   pattern = "*",
--   command = "checktime"
-- })
--
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI", "FocusGained" }, {
--   pattern = "*",
--   command = "checktime"
-- })

-- Handle copy paste between neovim and everyting else
vim.api.nvim_create_autocmd({ "FocusGained" }, {
	pattern = { "*" },
	command = [[call setreg("@", getreg("+"))]],
})
vim.api.nvim_create_autocmd({ "FocusLost" }, {
	pattern = { "*" },
	command = [[call setreg("+", getreg("@"))]],
})
