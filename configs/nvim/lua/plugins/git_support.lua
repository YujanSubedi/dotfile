return {
	-- Show git changes on file
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
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

	-- Git changes by other users
	{
		"f-person/git-blame.nvim",
		cmd = "GitBlameToggle",
		opts = {
			enabled = false, -- if you want to enable the plugin
			message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
			date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
			virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
		},
		keys = {
			{ "<leader>gi", "<cmd>GitBlameToggle<cr>", desc = "[G]it [B]lame toggle Git" },
			{ "<leader>gu", "<cmd>GitBlameOpenCommitURL<cr>", desc = "[G]itBlame Open Commit [U]RL Git" },
			{ "<leader>gy", "<cmd>GitBlameCopySHA<cr>", desc = "[G]itBlame [Y]ank Commit id Git" },
		},
	},
}
