return {
  "echasnovski/mini.nvim",
  version = false,
  config = function()
    require("mini.files").setup({
      -- Use `l` or `<CR>` to open the selected file and close the browser.
      mappings = {
        go_in = "l",
        go_in_plus = "<CR>",
        show_help = "?",
      },
    })
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

    -- Available Mini modules. Uncomment a setup call to enable one.
    -- require("mini.ai").setup() -- Better text objects
    -- require("mini.align").setup() -- Interactive text alignment
    -- require("mini.animate").setup() -- Cursor and scroll animations
    -- require("mini.base16").setup() -- Base16 theme utilities
    -- require("mini.basics").setup() -- Basic sensible defaults
    -- require("mini.bracketed").setup() -- Bracket-based navigation
    -- require("mini.bufremove").setup() -- Remove buffers without closing windows
    -- require("mini.clue").setup() -- Keybinding hints
    -- require("mini.colors").setup() -- Color manipulation utilities
    -- require("mini.colorscheme").setup() -- Colorscheme management
    -- require("mini.completion").setup() -- Completion engine
    -- require("mini.cursorword").setup() -- Highlight word under cursor
    -- require("mini.diff").setup() -- Diff visualization
    -- require("mini.doc").setup() -- Documentation generation
    -- require("mini.extra").setup() -- Extra text objects and mappings
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
    -- require("mini.pick").setup() -- Lightweight picker
    -- require("mini.sessions").setup() -- Session management
    -- require("mini.tabline").setup() -- Tabline
    -- require("mini.test").setup() -- Testing utilities
    -- require("mini.trailspace").setup() -- Trailing whitespace management
    -- require("mini.visits").setup() -- Visit tracking and navigation
  end,
}
