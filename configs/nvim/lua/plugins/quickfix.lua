return {
	-- Matchup for branching syntax
	{ "andymass/vim-matchup", event = { "BufReadPre", "BufNewFile" } },

	-- Replace word in the current directory
	{
		"smjonas/inc-rename.nvim",
		keys = { { "<leader>rn", ":IncRename ", desc = "[R]ename selected keyword,variable" } },
		opts = {},
	},

	-- Quickfix
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		keys = {
			{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
			{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
			{ "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
		},
	},
}
