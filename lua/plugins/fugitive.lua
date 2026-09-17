-- tpope/vim-fugitive — Git commands inside Neovim
--
-- Common commands (run as Ex commands, e.g. :Git status):
--   :Git (or :G)          Open git status summary buffer
--                          In the status buffer: `s` stage, `u` unstage,
--                          `-` toggle stage/unstage, `cc` commit, `=` diff,
--                          `dv` vertical diff split, `X` discard, `<CR>` open file
--   :Git commit            Commit staged changes
--   :Git push               Push current branch
--   :Git pull                Pull current branch
--   :Git blame               Blame the current file (press `q` to close,
--                            `A`/`D`/`C` align commit info)
--   :Gdiffsplit (:Gvdiffsplit) Diff current file against index/commit
--   :Gread                   Checkout (revert) current file from index
--   :Gwrite                  Stage current file (like `git add`)
--   :Gclog                   Load file's commit history into quickfix/location list
--   :Git log                 View commit log
--   :Git mergetool           Resolve merge conflicts
--
-- Not yet mapped under <leader>g — add here if/when wanted, e.g.:
--   { "<leader>gg", "<cmd>Git<CR>", desc = "Git status" }
--   { "<leader>gB", "<cmd>Git blame<CR>", desc = "Git blame (fugitive)" }

return {
  "tpope/vim-fugitive",
  cmd = { "Git", "Gvdiffsplit", "Gdiffsplit", "Gread", "Gwrite", "Gclog", "Gblame" },
}
