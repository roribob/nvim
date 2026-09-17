return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local function apply_theme()
        if vim.o.background == "light" then
          vim.cmd.colorscheme("tokyonight-day")
        else
          vim.cmd.colorscheme("tokyonight")
        end
      end

      vim.api.nvim_create_autocmd("OptionSet", {
        pattern = "background",
        callback = apply_theme,
      })

      apply_theme()
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    opts = {},
  },
}
