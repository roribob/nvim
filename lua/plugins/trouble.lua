return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  opts = {},
  init = function()
    -- Render every quickfix list in Trouble instead of the native window.
    -- This keeps vanilla keys intact: `grr`, `gri`, `:grep`, `:make` and
    -- `vim.diagnostic.setqflist()` all still populate the real quickfix list,
    -- so `]q`, `:cnext` and `:cdo` keep working. Only the *display* changes.
    vim.api.nvim_create_autocmd("BufWinEnter", {
      group = vim.api.nvim_create_augroup("my-nvim-trouble-qf", { clear = true }),
      callback = function(event)
        if vim.bo[event.buf].buftype ~= "quickfix" then
          return
        end
        -- Location lists are per-window and lose their context once the
        -- window closes, so leave those to the native quickfix window.
        if vim.fn.getwininfo(vim.api.nvim_get_current_win())[1].loclist == 1 then
          return
        end
        vim.schedule(function()
          vim.cmd("cclose")
          require("trouble").open("qflist")
        end)
      end,
    })
  end,
}
