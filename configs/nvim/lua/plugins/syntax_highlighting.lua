return {
	-- Highlight colors on buffer
	{ "brenoprata10/nvim-highlight-colors", event = "VeryLazy", opts = { enable_named_colors = false } },

	-- Rose-pine Colortheme
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = { styles = { transparency = true } },
		init = function()
			vim.cmd("colorscheme rose-pine")
		end,
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

	-- Show git changes on file
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	-- Treesitter for languages
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VimEnter",
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			ignore_install = { "org", "latex", "verilog" },
			ensure_installed = { "c", "cpp", "lua", "python", "norg" },
			highlight = { enable = true, additional_vim_regex_highlighting = { "ruby" } },
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
