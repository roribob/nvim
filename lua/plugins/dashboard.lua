return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Header
		dashboard.section.header.val = {
			"Hej!",
		}

		-- Menu
		dashboard.section.buttons.val = {
			-- dashboard.button("f", "󰈞  Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("f", "󰈞  Find File", "<cmd>FFFFind<CR>"),
			dashboard.button("r", "󰊄  Recent Files", "<cmd>Telescope oldfiles<CR>"),
			dashboard.button("g", "󰊢  Live Grep", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("n", "󰈔  New File", "<cmd>ene <BAR> startinsert<CR>"),
			dashboard.button("l", "💤 Lazy", "<cmd>Lazy<CR>"),
			dashboard.button(
				"c",
				"󰒓  Config",
				"<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath('config') })<CR>"
			),
			dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
		}

		-- Footer
		local function footer()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			return "⚡ Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
		end

		dashboard.section.footer.val = footer()

		-- Layout
		dashboard.config.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
			{ type = "padding", val = 1 },
			dashboard.section.footer,
		}

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])

		alpha.setup(dashboard.config)
	end,
}
