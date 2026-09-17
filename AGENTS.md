# AGENTS.md

Guidance for agents working on this Neovim config.

## Core principle: stay vanilla

Prefer built-in Neovim behaviour over custom behaviour. The goal is that the
keys and workflows learned here also work on any other Neovim — a colleague's
machine, a server, a container, `nvim --clean`. Every custom mapping is muscle
memory that does not transfer.

When a task can be solved by a default, a built-in option, or a core API, use
that instead of adding a mapping, plugin, or wrapper.

## Rules

1. **Check for a default first.** Before adding a mapping, verify nothing
   already covers it. Do not guess from memory — check the running binary:

   ```sh
   nvim --clean --headless '+lua print(vim.inspect(vim.fn.maparg("grr","n",false,true)))' +qa
   ```

   `:help lsp-defaults`, `:help default-mappings` and `:help news` list what
   ships out of the box. These grow with each release, so re-check after
   upgrades and remove mappings that became redundant.

2. **Never shadow a built-in mapping or motion.** `gr`, `gi`, `gc`, `s`, `S`,
   `x`, `Y` and similar all mean something in vanilla Neovim, including as
   prefixes for the `gr*` LSP defaults. If a binding must be replaced, say so
   explicitly and note what is lost.

3. **Custom mappings live under `<leader>`.** That namespace is unclaimed by
   default, so it is the safe place for config-specific additions. Do not
   colonise unprefixed keys.

4. **Prefer core over plugins.** Use `vim.lsp.enable`, `vim.pack`/`lazy` specs,
   `vim.diagnostic`, `vim.snippet`, `'tagfunc'`, `'formatexpr'`, `'grepprg'`,
   `:terminal` and the like before reaching for a plugin that reimplements them.
   A plugin needs a reason beyond convenience.

5. **Do not remap what an option can do.** Reach for `vim.o`/`vim.opt` settings
   before writing a mapping or autocommand to emulate them.

6. **Keep plugins thin.** Configure plugins to fit Neovim's conventions rather
   than replacing them. Avoid plugins that install large unprefixed keymap sets;
   if one does, disable its defaults.

7. **Document deviations.** Any intentional departure from vanilla gets a
   comment stating what default it replaces and why it is worth the cost.

## Known deliberate deviations

- `gd` / `gD` / `gy` → LSP definition, declaration, type definition
  (`lua/plugins/lsp.lua`). Neovim ships no LSP default for definition; `<C-]>`
  works via `'tagfunc'`, but `gd` is near-universal in real configs. This
  overrides the built-in keyword-based declaration search.

## Working style

- Verify claims about defaults and LSP attachment by running Neovim headless,
  rather than asserting them.
- Prefer editing existing files over adding new ones; this config is small and
  should stay readable.
