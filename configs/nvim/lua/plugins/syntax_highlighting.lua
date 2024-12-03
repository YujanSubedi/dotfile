return {
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
		event = "VimEnter",
		build = ":TSUpdate",
		opts = {
			-- ensure_installed = "all",
			ensure_installed = { "c", "cpp", "lua", "python", "norg" },
			ignore_install = { "org", "latex" },
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
