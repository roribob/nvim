return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "mason-org/mason-lspconfig.nvim",
      dependencies = { "mason-org/mason.nvim" },
      -- `automatic_enable` defaults to true: every server installed through
      -- Mason is enabled automatically, so it needs no list here.
      -- `ensure_installed` installs these on startup if they are missing.
      opts = {
        ensure_installed = { "lua_ls", "vtsls", "tailwindcss", "gopls" },
      },
    },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("my-nvim-lsp", { clear = true }),
      callback = function(event)
        local function map(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
        end

        -- Nvim 0.12 already provides `grr` references, `gri` implementation,
        -- `gra` code action, `grn` rename, `gO` symbols and `K` hover.
        -- Only add what has no default, and avoid shadowing `gr`/`gi`.
        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gD", vim.lsp.buf.declaration, "Go to declaration")
        map("gy", vim.lsp.buf.type_definition, "Go to type definition")
      end,
    })
  end,
}
