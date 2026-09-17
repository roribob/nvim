return {
  "lewis6991/gitsigns.nvim",
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      map("n", "<leader>gp", gitsigns.preview_hunk, "Preview hunk")
      map("n", "<leader>gb", gitsigns.blame_line, "Blame line")
      map("n", "<leader>gs", gitsigns.stage_hunk, "Stage hunk")
      map("n", "<leader>gr", gitsigns.reset_hunk, "Reset hunk")
      map("n", "<leader>gd", gitsigns.diffthis, "Diff this")

      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, "Next hunk")

      map("n", "[c", function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, "Prev hunk")

      -- Additional actions (g-prefixed, avoiding collisions with the above)
      map("v", "<leader>gs", function()
        gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage hunk (selection)")

      map("v", "<leader>gr", function()
        gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Reset hunk (selection)")

      map("n", "<leader>gS", gitsigns.stage_buffer, "Stage buffer")
      map("n", "<leader>gR", gitsigns.reset_buffer, "Reset buffer")
      map("n", "<leader>gi", gitsigns.preview_hunk_inline, "Preview hunk inline")

      map("n", "<leader>gD", function()
        gitsigns.diffthis("~")
      end, "Diff this (~)")

      map("n", "<leader>gQ", function()
        gitsigns.setqflist("all")
      end, "Hunks to qflist (all)")
      map("n", "<leader>gq", gitsigns.setqflist, "Hunks to qflist")

      -- Toggles
      map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, "Toggle line blame")
      map("n", "<leader>gtw", gitsigns.toggle_word_diff, "Toggle word diff")

      -- Text object
      map({ "o", "x" }, "gih", gitsigns.select_hunk, "Select hunk")
    end,
  },
}
