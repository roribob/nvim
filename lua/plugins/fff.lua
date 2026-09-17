return {
  "dmtrKovalenko/fff",
  build = function()
    require("fff.download").download_or_build_binary()
  end,
  lazy = false,

  -- Search query examples (see `:help fff.nvim`, section "CONSTRAINTS"):
  --   !git:clean                       all dirty Git files
  --   git:modified                     modified files only
  --   git:staged                       staged files only
  --   git:untracked                    untracked files only
  --   test/                            files below a directory named `test`
  --   !test/                           exclude files below `test`
  --   src/**/*.lua                     filter with a glob
  --   !git:clean src/**/*.lua !test/   combine filters
  -- Live grep also supports extension filters, for example: `*.lua TODO`.
  keys = {
    { "ff", function() require("fff").find_files() end, desc = "Find files" },
    { "fg", function() require("fff").live_grep() end, desc = "Live grep" },
    { "<leader>ff", function() require("fff").find_files() end, desc = "Find files (Also just ff)" },
    { "<leader>fg", function() require("fff").live_grep() end, desc = "Live grep (Also just fg)" },
  },
  opts = {
    -- These are fff's own defaults, spelled out explicitly so they are easy to tweak.
    keymaps = {
      close = "<Esc>",
      select = "<CR>",
      select_split = "<C-s>",
      select_vsplit = "<C-v>",
      select_tab = "<C-t>",
      move_up = { "<Up>", "<C-p>" },
      move_down = { "<Down>", "<C-n>" },
      preview_scroll_up = "<C-u>",
      preview_scroll_down = "<C-d>",
      toggle_debug = "<F2>",
      -- grep mode: cycle between plain text, regex, and fuzzy search
      cycle_grep_modes = "<S-Tab>",
      -- grep mode only: insert a literal `\n` to search across lines
      insert_newline_escape = "<C-CR>",
      -- grep mode only: jump cursor to first item of next/prev file group
      grep_jump_to_next_file = { "<C-A-n>", "<A-Down>" },
      grep_jump_to_prev_file = { "<C-A-p>", "<A-Up>" },
      cycle_previous_query = "<C-Up>",
      cycle_forward_query = "<C-Down>",
      -- multi-select keymaps for quickfix
      toggle_select = "<Tab>",
      send_to_quickfix = "<C-q>",
      -- normal-mode-only inside the picker (exit with jj or another bind)
      focus_list = "<leader>l",
      focus_preview = "<leader>p",
    },
    -- extra keymaps for the picker input, keyed by mode, e.g.
    -- mappings = { i = { ["<A-BS>"] = function() vim.api.nvim_input("<C-w>") end } }
    mappings = {},
  },
}
