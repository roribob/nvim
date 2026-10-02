local group = vim.api.nvim_create_augroup("my-nvim", { clear = true })

-- Highlight yanked text. Disabled: mini.basics registers the same
-- TextYankPost highlight (see lua/plugins/mini.lua).
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   group = group,
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = { "help", "qf", "lspinfo", "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf })
  end,
})
