local ensure_installed = {
  "lua",
  "vim",
  "vimdoc",
  "query",
  "bash",
  "markdown",
  "markdown_inline",
}

return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install(ensure_installed)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local language = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if language and vim.tbl_contains(ensure_installed, language) then
          vim.treesitter.start(args.buf)
          vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
