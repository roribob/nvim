return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    spec = {
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>a", group = "Agent" },
      { "<leader>x", group = "Trouble/Diagnostics" },
    },
  },
}
