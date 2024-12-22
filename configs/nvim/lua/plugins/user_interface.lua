return {
	-- Replace word in the current directory
	{
		"smjonas/inc-rename.nvim",
		keys = { { "<leader>rn", ":IncRename ", desc = "[R]ename selected keyword,variable" } },
		opts = {},
	},

	-- Find color coding
	{
		"max397574/colortils.nvim",
		cmd = "Colortils",
		keys = { { "<leader>cs", "<cmd>Colortils<cr>", desc = "[C]olortils [S]elections" } },
		opts = {},
	},

	-- Auto resize windows
	{
		"anuvyklack/windows.nvim",
		dependencies = { "anuvyklack/middleclass" },
		keys = { { "<leader>wt", "<cmd>WindowsToggleAutowidth<cr>", desc = "[W]indows [T]oggle Autowidth" } },
		event = "VeryLazy",
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

	-- Better Notification, Command line and which key
	{
		"folke/snacks.nvim",
		dependencies = {
			{ "MunifTanjim/nui.nvim" },
			{ "folke/noice.nvim", opts = {} },
			{ "folke/which-key.nvim", opts = {} },
		},
		event = "VimEnter",
		opts = {
			quickfile = { enabled = true },
			statuscolumn = { enabled = true },
			bigfile = { enabled = true, size = 1048576 },
			notifier = { enabled = true, width = { min = 15, max = 45 }, top_down = false },
			styles = { notification = { wo = { wrap = true } } },
		},
		keys = {
			{ "<leader>.", "<cmd>lua Snacks.scratch()<cr>", desc = "Toggle Scratch Buffer" },
			{ "<leader>S", "<cmd>lua Snacks.scratch.select()<cr>", desc = "Select Scratch Buffer" },
			{ "<leader>nf", "<cmd>lua Snacks.notifier.show_history()<cr>", desc = "Notification History" },
			{ "<leader>bk", "<cmd>lua Snacks.bufdelete()<cr>", desc = "Delete Buffer" },
			{ "<leader>rf", "<cmd>lua Snacks.rename.rename_file()<cr>", desc = "Rename File" },
			{ "<leader>gu", "<cmd>lua Snacks.gitbrowse()<cr>", desc = "Git Browse" },
			{ "<leader>gi", "<cmd>lua Snacks.git.blame_line()<cr>", desc = "Git Blame Line" },
		},
	},
}
