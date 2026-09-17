local M1 = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- Optional image support for file preview: See `# Preview Mode` for more information.
		-- {"3rd/image.nvim", opts = {}},
		-- OR use snacks.nvim's image module:
		-- "folke/snacks.nvim",
	},
	lazy = true, -- neo-tree will lazily load itself
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		enable_git_status = true,
		filesystem = {
			window = {
				mappings = {
					["\\"] = "close_window",
				},
			},
		},
	},
	keys = {
		{ "<C-n>", ":Neotree toggle left filesystem reveal<CR>", desc = "Open file tree", silent = true },
		{ "<leader>e", ":Neotree toggle left filesystem reveal<CR>", desc = "Open file tree", silent = true },
		-- { '-',     ':Neotree float reveal_force_cwd<CR>',        desc = 'Open file tree', silent = true },
		-- { '\\',    ':Neotree float reveal_force_cwd<cr>',        desc = 'Open file tree', silent = true },
	},
}

local M2 = {
	"nvim-neo-tree/neo-tree.nvim",
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				show_hidden_count = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				never_show = { ".git" },
			},
		},
	},
}

return M1
