return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- `~/.local/bin/toggle-theme` (macOS-only helper) records the wanted
      -- mode here. On machines without that file, fall back to vanilla
      -- `'background'` so `:set background=light|dark` still works.
      local state_file = vim.fn.expand("~/.local/state/theme-toggle/mode")

      local function file_mode()
        local f = io.open(state_file, "r")
        if not f then
          return nil
        end
        local mode = vim.trim(f:read("*a") or "")
        f:close()
        return (mode == "light" or mode == "dark") and mode or nil
      end

      local function apply(mode)
        vim.o.background = mode
        vim.cmd.colorscheme(mode == "light" and "tokyonight-day" or "tokyonight-storm")
      end

      local mode = file_mode()
      if not mode then
        vim.api.nvim_create_autocmd("OptionSet", {
          pattern = "background",
          callback = function()
            apply(vim.o.background)
          end,
        })
        apply(vim.o.background)
        return
      end

      apply(mode)

      -- Follow the state file while this machine has the toggle helper.
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          local m = file_mode()
          if m and m ~= vim.o.background then
            apply(m)
          end
        end,
      })

      -- Poll as well so a toggle is picked up without focus changes and
      -- without signalling the process.
      local timer = vim.uv.new_timer()
      timer:start(
        1000,
        1000,
        vim.schedule_wrap(function()
          local m = file_mode()
          if m and m ~= vim.o.background then
            apply(m)
          end
        end)
      )
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    opts = {},
  },
}
