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
		keys = { { "<leader>gc", "<cmd>Colortils<cr>", desc = "[G]et [C]olortils" } },
		opts = {},
	},

	-- Auto resize windows
	{
		"anuvyklack/windows.nvim",
		dependencies = { "anuvyklack/middleclass" },
		keys = {
			{ "<leader>wa", "<cmd>WindowsEnableAutowidth<cr>", desc = "[W]indows Enable [A]utowidth" },
			{ "<leader>wt", "<cmd>WindowsToggleAutowidth<cr>", desc = "[W]indows [T]oggle Autowidth" },
		},
		opts = {},
	},

	-- Command line on middle, show keys, surround and arrounds
	{
		"folke/noice.nvim",
		dependencies = {
			{ "andymass/vim-matchup" },
			{ "MunifTanjim/nui.nvim" },
			{ "folke/which-key.nvim", event = "VeryLazy", opts = {} },
			{ "echasnovski/mini.ai", opts = { n_lines = 25 } },
			{ "echasnovski/mini.surround", opts = { n_lines = 25 } },
		},
		event = "VeryLazy",
		opts = {},
	},

	-- Better notification, lazygit and other features
	{
		"folke/snacks.nvim",
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
			{ "<leader>nf", "Snacks.notifier.show_history()", desc = "Notification History" },
			{ "<leader>bk", "Snacks.bufdelete()", desc = "Delete Buffer" },
			{ "<leader>rf", "<cmd>lua Snacks.rename.rename_file()<cr>", desc = "Rename File" },
			{ "<leader>gu", "<cmd>lua Snacks.gitbrowse()<cr>", desc = "Git Browse" },
			{ "<leader>gi", "<cmd>lua Snacks.git.blame_line()<cr>", desc = "Git Blame Line" },
			-- { "<leader>gf", "<cmd>lua Snacks.lazygit.log_file()<cr>", desc = "Lazygit Current File History" },
			-- { "<leader>gg", "<cmd>lua Snacks.lazygit()<cr>", desc = "Lazygit" },
			-- { "<leader>gl", "<cmd>lua Snacks.lazygit.log()<cr>", desc = "Lazygit Log (cwd)" },
		},
	},
}
