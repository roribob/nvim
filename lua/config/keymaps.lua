local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<leader>?", function()
  require("which-key").show({ global = false })
end, { desc = "Show keybindings" })
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Write buffer" })
map("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit window" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics" })

-- `J`/`K` walk the open Trouble list (and jump to the item) without leaving the
-- editor window. When no Trouble view is open they keep their vanilla meaning:
-- `J` joins lines, `K` runs the LSP hover / `keywordprg`.
local function trouble_move(action, fallback)
  return function()
    local ok, trouble = pcall(require, "trouble")
    if ok and trouble.is_open() then
      trouble[action]({ jump = true, focus = false })
      return
    end
    if type(fallback) == "function" then
      fallback()
      return
    end
    local count = vim.v.count > 0 and vim.v.count or ""
    vim.cmd("normal! " .. count .. fallback)
  end
end

map("n", "J", trouble_move("next", "J"), { desc = "Next Trouble item (or join lines)" })
map("n", "K", trouble_move("prev", function()
  -- Neovim's default `K` is an LSP hover when a client is attached, so keep
  -- that instead of falling back to `keywordprg`.
  if next(vim.lsp.get_clients({ bufnr = 0 })) then
    vim.lsp.buf.hover()
  else
    vim.cmd("normal! K")
  end
end), { desc = "Prev Trouble item (or hover)" })
-- No custom list navigation: Neovim's bracket motions already cover it and
-- they work on any machine (`:help ]q`, `:help ]d`, `:help various-motions`):
--
--   ]q / [q    next / previous quickfix entry      ]Q / [Q  last / first
--   ]l / [l    next / previous location list entry ]L / [L  last / first
--   ]d / [d    next / previous diagnostic          ]D / [D  last / first
--   ]b / [b    next / previous buffer              ]B / [B  last / first
--   ]<Space>   add a blank line below              [<Space> above
--   <C-w>d     show the diagnostic under the cursor
--   <C-]>      jump to definition via 'tagfunc'    <C-t>    jump back
--
-- On a Nordic layout `[` and `]` need AltGr. Remapping just the prefixes
-- (`ö` -> `[`, `ä` -> `]`, with `remap = true`) puts the whole family on the
-- home row without inventing new bindings.
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
