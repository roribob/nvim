local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

vim.keymap.set({ "i", "n", "v" }, "<C-s>", "<cmd>write<cr>", { desc = "Save file" })

vim.keymap.set("n", "<]-d>", ":cnext<CR>", opts)
vim.keymap.set("n", "<[-d>", ":cprevious<CR>", opts)

vim.keymap.set("n", "<S-j>", ":cnext<CR>", opts)
vim.keymap.set("n", "<S-j>", ":cprevious<CR>", opts)

function nmap(keymap, cmdOrFunc, opts)
	vim.keymap.set("n", keymap, cmdOrFunc, opts)
end

nmap("<leader>qq", ":quitall<CR>", opts)

-- Git
nmap("<leader>gg", function()
	if vim.fn.executable("lazygit") == 1 then
		-- Create a buffer for lazygit
		local buf = vim.api.nvim_create_buf(false, true)

		-- Calculate window dimensions (90% of screen)
		local width = math.floor(vim.o.columns * 0.9)
		local height = math.floor(vim.o.lines * 0.9)
		local row = math.floor((vim.o.lines - height) / 2)
		local col = math.floor((vim.o.columns - width) / 2)

		-- Create floating window
		local win = vim.api.nvim_open_win(buf, true, {
			relative = "editor",
			width = width,
			height = height,
			row = row,
			col = col,
			style = "minimal",
			border = "rounded",
			title = " Lazygit ",
			title_pos = "center",
		})

		-- Start lazygit in the terminal
		vim.fn.termopen("lazygit", {
			on_exit = function()
				if vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_win_close(win, true)
				end
			end,
		})

		-- Enter insert mode
		vim.cmd("startinsert")
	else
		vim.notify("Lazygit is not installed", vim.log.levels.ERROR)
	end
end, { desc = "Open Lazygit" })
