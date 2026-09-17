return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    -- Deviation: <CR> accepts the selected completion item, like <C-i>.
    -- Vanilla blink.cmp leaves <CR> as a plain newline.
    keymap = {
      ["<CR>"] = { "select_and_accept", "fallback" },
    },
  },
}
