return {
  "echasnovski/mini.nvim",
  version = false,
  dependencies = {
    {
      "folke/which-key.nvim",
      opts_extend = { "spec" },
      opts = {
        spec = { { "<leader>s", group = "Search / Help" } },
      },
    },
  },
  config = function()
    -- Sensible options, mappings and autocommands (:h mini.basics).
    -- The settings it covers are commented out in lua/config/options.lua
    -- and lua/config/autocmds.lua.
    require("mini.basics").setup()

    require("mini.pick").setup()
    require("mini.extra").setup()

    vim.keymap.set("n", "<leader>sk", "<cmd>Pick keymaps<CR>", { desc = "Search keymaps" })
    vim.keymap.set("n", "<leader>sc", "<cmd>Pick commands<CR>", { desc = "Search commands" })
    vim.keymap.set("n", "<leader>sh", "<cmd>Pick help<CR>", { desc = "Search help tags" })
    vim.keymap.set("n", "<leader>sq", "<cmd>help quickref<CR>", { desc = "General cheat sheet" })
    vim.keymap.set("n", "<leader>sl", "<cmd>help lsp-defaults<CR>", { desc = "LSP default bindings" })

    local files = require("mini.files")
    files.setup({
      -- Use `l` or `<CR>` to open the selected file and close the browser.
      mappings = {
        go_in = "l",
        go_in_plus = "<CR>",
        show_help = "?",
      },
    })
    -- Replace the built-in upward line motion with MiniFiles' documented toggle pattern.
    vim.keymap.set("n", "-", function()
      if files.close() == nil then
        files.open(vim.api.nvim_buf_get_name(0), false)
      end
    end, { desc = "Toggle file browser" })

    require("mini.comment").setup()
    -- require("mini.clue").setup({}) -- Key hints; Which-key is active instead.

    -- Surround: `sa{motion}{char}` adds, `sd{char}` deletes, and
    -- `sr{old}{new}` replaces a surrounding pair. Visual `sa{char}` works too.
    require("mini.surround").setup()

    -- Move visual selections vertically with macOS Option+j/k output.
    require("mini.move").setup({
      mappings = {
        left = "<M-h>",
        right = "<M-l>",
        -- down = "<M-j>",
        -- up = "<M-k>",
        down = "∆", -- Option+j with the macOS U.S./Swertie symbol layer.
        up = "˚", -- Option+k with the macOS U.S./Swertie symbol layer.
        line_left = "<M-h>",
        line_right = "<M-l>",
        line_down = "<M-j>",
        line_up = "<M-k>",
      },
    })
    -- Keep terminal Meta bindings as aliases when Option is configured as Alt.
    vim.keymap.set("x", "<M-j>", function() MiniMove.move_selection("down") end, { desc = "Move selection down" })
    vim.keymap.set("x", "<M-k>", function() MiniMove.move_selection("up") end, { desc = "Move selection up" })
    -- Ctrl-j normally duplicates `j`; Ctrl-k is unused in Visual mode.
    vim.keymap.set("x", "<C-j>", function() MiniMove.move_selection("down") end, { desc = "Move selection down" })
    vim.keymap.set("x", "<C-k>", function() MiniMove.move_selection("up") end, { desc = "Move selection up" })

    -- Available Mini modules. Uncomment a setup call to enable one.
    -- require("mini.ai").setup() -- Better text objects
    -- require("mini.align").setup() -- Interactive text alignment
    -- require("mini.animate").setup() -- Cursor and scroll animations
    -- require("mini.base16").setup() -- Base16 theme utilities
    -- require("mini.bracketed").setup() -- Bracket-based navigation
    -- require("mini.bufremove").setup() -- Remove buffers without closing windows
    -- require("mini.clue").setup() -- Keybinding hints
    -- require("mini.colors").setup() -- Color manipulation utilities
    -- require("mini.colorscheme").setup() -- Colorscheme management
    -- require("mini.completion").setup() -- Completion engine
    -- require("mini.cursorword").setup() -- Highlight word under cursor
    -- require("mini.diff").setup() -- Diff visualization
    -- require("mini.doc").setup() -- Documentation generation
    -- require("mini.fuzzy").setup() -- Fuzzy matching utilities
    -- require("mini.git").setup() -- Git integration
    -- require("mini.hipatterns").setup() -- Pattern highlighting
    -- require("mini.hues").setup() -- Generate colorschemes
    -- require("mini.icons").setup() -- Filetype icons
    -- require("mini.indentscope").setup() -- Indentation scope visualization
    -- require("mini.jump").setup() -- Jump to visible text
    -- require("mini.jump2d").setup() -- Two-dimensional jumping navigation
    -- require("mini.map").setup() -- Minimap
    -- require("mini.misc").setup() -- Miscellaneous utilities
    -- require("mini.notify").setup() -- Notification manager
    -- require("mini.operators").setup() -- Text operators
    -- require("mini.pairs").setup() -- Automatic bracket pairs
    -- require("mini.sessions").setup() -- Session management
    -- require("mini.tabline").setup() -- Tabline
    -- require("mini.test").setup() -- Testing utilities
    -- require("mini.trailspace").setup() -- Trailing whitespace management
    -- require("mini.visits").setup() -- Visit tracking and navigation
  end,
}
