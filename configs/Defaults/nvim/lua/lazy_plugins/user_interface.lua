return {
	-- Rose-pine Colortheme
	{
		"rose-pine/neovim",
		event = "VeryLazy",
		name = "rose-pine",
		opts = { styles = { transparency = true } },
		init = function()
			vim.cmd("colorscheme rose-pine-main")
		end,
	},

	-- Auto Pair, show paring, context and diagnostics
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = { separator = "—", max_lines = 5 },
		event = "VeryLazy",
		dependencies = {
			{ "andymass/vim-matchup" },
			{ "windwp/nvim-autopairs",                  opts = {} },
			{ "rachartier/tiny-inline-diagnostic.nvim", opts = {} },
		},
	},

	-- Mini Git diff signs, Arround and Surround
	{
		"echasnovski/mini.diff",
		event = "VeryLazy",
		dependencies = {
			{ "echasnovski/mini.ai",       opts = { n_lines = 25 } },
			{ "echasnovski/mini.surround", opts = { n_lines = 25 } },
		},
		opts = { view = { style = "sign", signs = { add = "+", change = "~", delete = "_" } } },
		keys = { { "<leader>gm", "<cmd>lua MiniDiff.toggle_overlay()<cr>", desc = "Toggle Git MiniDiff View" } },
	},

	-- Looks of command mode, which key and highlights
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-web-devicons" },
			{ "folke/which-key.nvim",       opts = {} },
			{ "folke/todo-comments.nvim",   opts = {} },
		},
		opts = {
			cmdline = {
				format = {
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				},
			},
		},
	},
}
