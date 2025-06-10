return {
	-- Rose-pine Colortheme
	{
		"rose-pine/neovim",
		event = "VeryLazy",
		name = "rose-pine",
		opts = { styles = { transparency = true } },
		init = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	-- Highlight colors
	{
		"brenoprata10/nvim-highlight-colors",
		keys = {
			{ "<leader>ehe", "<cmd>HighlightColors On<cr>", desc = "[T]oggle [H]ighlight" },
			{ "<leader>ehd", "<cmd>HighlightColors Off<cr>", desc = "[T]oggle [H]ighlight" },
		},
		opts = { enable_named_colors = false },
	},

	-- Auto resize windows
	{
		"anuvyklack/windows.nvim",
		dependencies = { "anuvyklack/middleclass" },
		keys = { { "<leader>wt", "<cmd>WindowsToggleAutowidth<cr>", desc = "[W]indows [T]oggle Autowidth" } },
		-- event = "VeryLazy",
		opts = {},
	},

	-- Mini Git diff signs, Arround and Surround
	{
		"echasnovski/mini.diff",
		dependencies = {
			{ "echasnovski/mini.ai", opts = { n_lines = 25 } },
			{ "echasnovski/mini.surround", opts = { n_lines = 25 } },
		},
		event = "VeryLazy",
		opts = { view = { style = "sign", signs = { add = "+", change = "~", delete = "_" } } },
		keys = { { "<leader>gm", "<cmd>lua MiniDiff.toggle_overlay()<cr>", desc = "Toggle Git MiniDiff View" } },
	},

	-- Hide .env vars
	{
		"laytan/cloak.nvim",
		ft = "sh",
		keys = { { "<leader>ct", "<cmd>CloakToggle<cr>", desc = "[C]oak [T]oggle" } },
		opts = {
			enabled = true,
			cloak_character = "*",
			highlight_group = "Comment",
			patterns = { { file_pattern = { ".env*" }, cloak_pattern = "=.+" } },
		},
	},

	-- Treesitter for languages
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			ignore_install = { "org", "latex", "verilog" },
			ensure_installed = { "c", "cpp", "rust", "bash", "lua", "python", "norg", "markdown" },
			highlight = { enable = true, additional_vim_regex_highlighting = { "ruby" } },
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
