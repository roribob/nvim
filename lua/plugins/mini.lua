return {
	"echasnovski/mini.nvim",
	version = false,

	config = function()
		require("mini.ai").setup()
		-- require("mini.animate").setup()
		require("mini.diff").setup()
		require("mini.surround").setup()
		-- require("mini.notify").setup()
		require("mini.files").setup({
			mappings = {
				-- close = "q",
				-- go_in = "l",
				-- go_in_plus = "<Backspace>",
				go_in_plus = "<CR>",
				-- go_out = { "-", "h" },
				-- go_out = "h",
				go_out_plus = "-",
				-- mark_goto = "'",
				-- mark_set = "m",
				-- reset = "<BS>",
				-- reveal_cwd = "@",
				-- show_help = "g?",
				-- synchronize = "=",
				-- trim_left = "<",
				-- trim_right = ">",
			},
		})

		-- Keymap: press `-` to open MiniFiles at current file
		vim.keymap.set("n", "-", function()
			local buf_path = vim.api.nvim_buf_get_name(0)
			local dir = vim.fn.fnamemodify(buf_path, ":p:h")
			require("mini.files").open(dir)
		end, { desc = "Open file explorer (mini.files)" })
	end,
}
