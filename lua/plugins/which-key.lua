return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>f", group = "Find" },
      -- Gitsigns installs its mappings in `on_attach`, so they do not exist in
      -- the start buffer. Keep those actions buffer-local, but advertise them
      -- here so Which-key can show the complete Git menu everywhere.
      {
        "<leader>g",
        group = "Git",
        { "<leader>gp", desc = "Preview hunk" },
        { "<leader>gb", desc = "Blame line" },
        { "<leader>gs", desc = "Stage hunk" },
        { "<leader>gr", desc = "Reset hunk" },
        { "<leader>gd", desc = "Diff this" },
        { "<leader>gS", desc = "Stage buffer" },
        { "<leader>gR", desc = "Reset buffer" },
        { "<leader>gi", desc = "Preview hunk inline" },
        { "<leader>gD", desc = "Diff this (~)" },
        { "<leader>gQ", desc = "Hunks to qflist (all)" },
        { "<leader>gq", desc = "Hunks to qflist" },
        { "<leader>gt", group = "Toggles" },
        { "<leader>gtb", desc = "Toggle line blame" },
        { "<leader>gtw", desc = "Toggle word diff" },
      },
      {
        mode = "v",
        { "<leader>g", group = "Git" },
        { "<leader>gs", desc = "Stage hunk (selection)" },
        { "<leader>gr", desc = "Reset hunk (selection)" },
      },
      { "<leader>a", group = "Agent" },
      { "<leader>x", group = "Trouble/Diagnostics" },
    },
  },
}
