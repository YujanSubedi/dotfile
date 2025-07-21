return {
	-- Enhanced f, F, t, T and remap s to serarch
	{
		"folke/flash.nvim",
		keys = {
			{ "<a-f>", mode = { "n", "x", "o" }, "<cmd>lua require('flash').jump()<cr>", desc = "Flash" },
			{ "<a-s>", mode = { "n", "x", "o" }, "<cmd>lua require('flash').treesitter()<cr>", desc = "Flash Tree" },
			{ "r", mode = "o", "<cmd>lua require('flash').remote()<cr>", desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, "<cmd>lua require('flash').treesitter_search()<cr>", desc = "Tree Search" },
			{ "<c-s>", mode = { "c" }, "<cmd>lua require('flash').toggle()<cr>", desc = "Toggle Flash Search" },
		},
		opts = {},
	},

	-- Looks of command mode, which key and highlights
	{
		"folke/noice.nvim",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "MunifTanjim/nui.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "folke/which-key.nvim", opts = {} },
			{ "folke/todo-comments.nvim", opts = {} },
		},
		event = "VeryLazy",
		opts = {
			cmdline = {
				format = {
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				},
			},
		},
	},

	-- Pickers, notification
	{
		"folke/snacks.nvim",
		event = "VimEnter",
		opts = {
			input = { enabled = true },
			quickfile = { enabled = true },
			statuscolumn = { enabled = true },
			-- indent = { enabled = true },
			bigfile = { enabled = true, size = 1048576 },
			notifier = { enabled = true, width = { min = 15, max = 45 }, top_down = false },
			styles = { notification = {} },
			picker = { enabled = true },
		},
		keys = {
			{ "<leader>.", "<cmd>lua Snacks.scratch()<cr>", desc = "Toggle Scratch Buffer" },
			{ "<leader>nf", "<cmd>lua Snacks.notifier.show_history()<cr>", desc = "Notification History" },
			{ "<leader>bk", "<cmd>lua Snacks.bufdelete()<cr>", desc = "Delete Buffer" },
			{ "<leader>rf", "<cmd>lua Snacks.rename.rename_file()<cr>", desc = "Rename File" },
			{ "<leader>gu", "<cmd>lua Snacks.gitbrowse()<cr>", desc = "Git Browse" },
			{ "<leader>gi", "<cmd>lua Snacks.git.blame_line()<cr>", desc = "Git Blame Line" },
			-- { "<leader>fe", "<cmd>lua Snacks.explorer()<cr>", desc = "File Explorer" },

			-- Find files
			{
				"<leader>ff",
				'<cmd>lua Snacks.picker.files({ layout = { preset = "select" } }) <cr>',
				desc = "Find Files",
			},
			{
				"<leader><space>",
				'<cmd>lua Snacks.picker.buffers({ layout = { preset = "select" } }) <cr>',
				desc = "Find Files Buffers",
			},
			{ "<leader>fp", "<cmd>lua Snacks.picker.projects() <cr>", desc = "Projects" },

			-- Grep
			{
				"<leader>/",
				'<cmd>lua Snacks.picker.lines({ layout = { preset = "telescope", preview = false } }) <cr>',
				desc = "Buffer Lines",
			},
			{
				"<leader>fw",
				'<cmd>lua Snacks.picker.grep_word({ layout = { preset = "telescope" } }) <cr>',
				desc = "Visual selection or word",
				mode = { "n", "x" },
			},
			{ "<leader>fg", '<cmd>lua Snacks.picker.grep({ layout = { preset = "telescope" } }) <cr>', desc = "Grep" },
			{
				"<leader>:",
				'<cmd>lua Snacks.picker.command_history({ layout = { preset = "telescope", preview = false } }) <cr>',
				desc = "Command History",
			},
			{
				"<leader>fc",
				'<cmd>lua Snacks.picker.colorschemes({ layout = { preset = "vertical" } }) <cr>',
				desc = "Change colorschemes",
			},

			-- Git
			{ "<leader>gb", "<cmd>lua Snacks.picker.git_branches() <cr>", desc = "Git Branches" },
			{ "<leader>gl", "<cmd>lua Snacks.picker.git_log() <cr>", desc = "Git Log" },
			{ "<leader>gL", "<cmd>lua Snacks.picker.git_log_line() <cr>", desc = "Git Log Line" },
			{ "<leader>gs", "<cmd>lua Snacks.picker.git_status() <cr>", desc = "Git Status" },
			{ "<leader>gS", "<cmd>lua Snacks.picker.git_stash() <cr>", desc = "Git Stash" },
			{ "<leader>gd", "<cmd>lua Snacks.picker.git_diff() <cr>", desc = "Git Diff (Hunks)" },
			{ "<leader>gf", "<cmd>lua Snacks.picker.git_log_file() <cr>", desc = "Git Log File" },

			-- Search
			{
				"<leader>fs",
				'<cmd>lua Snacks.picker({ layout = { preset = "select" } }) <cr>',
				desc = "Snacks Picker Search",
			},
			{ "<leader>fr", "<cmd>lua Snacks.picker.registers() <cr>", desc = "Registers" },
			{ "<leader>fD", "<cmd>lua Snacks.picker.diagnostics() <cr>", desc = "Diagnostics" },
			{ "<leader>fD", "<cmd>lua Snacks.picker.diagnostics_buffer() <cr>", desc = "Buffer Diagnostics" },
			{
				"<leader>fh",
				'<cmd>lua Snacks.picker.help({ layout = { preset = "telescope" } }) <cr>',
				desc = "Help Pages",
			},
			{ "<leader>fH", "<cmd>lua Snacks.picker.highlights() <cr>", desc = "Highlights" },
			{
				"<leader>fi",
				'<cmd>lua Snacks.picker.icons({ layout = { preset = "telescope", preview = false } }) <cr>',
				desc = "Icons",
			},
			{ "<leader>fj", "<cmd>lua Snacks.picker.jumps() <cr>", desc = "Jumps" },
			{
				"<leader>fk",
				'<cmd>lua Snacks.picker.keymaps({ layout = { preset = "telescope", preview = false } }) <cr>',
				desc = "Keymaps",
			},
			{ "<leader>fm", "<cmd>lua Snacks.picker.marks() <cr>", desc = "Marks" },
			{
				"<leader>fM",
				'<cmd>lua Snacks.picker.man({ layout = { preset = "telescope" } }) <cr>',
				desc = "Man Pages",
			},
			{
				"<leader>fl",
				'<cmd>lua Snacks.picker.lazy({ layout = { preset = "telescope", preview = false } }) <cr>',
				desc = "Search for Lazy Plugin Spec",
			},
			{ "<leader>fu", "<cmd>lua Snacks.picker.undo() <cr>", desc = "Undo History" },

			-- LSP
			{ "gd", "<cmd>lua Snacks.picker.lsp_definitions() <cr>", desc = "Goto Definition" },
			{ "gD", "<cmd>lua Snacks.picker.lsp_declarations() <cr>", desc = "Goto Declaration" },
			{ "gr", "<cmd>lua Snacks.picker.lsp_references() <cr>", nowait = true, desc = "References" },
			{ "gI", "<cmd>lua Snacks.picker.lsp_implementations() <cr>", desc = "Goto Implementation" },
			{ "gy", "<cmd>lua Snacks.picker.lsp_type_definitions() <cr>", desc = "Goto T[y]pe Definition" },
			{ "<leader>ta", "<cmd>lua Snacks.picker.lsp_symbols() <cr>", desc = "LSP Symbols" },
			{ "<leader>tA", "<cmd>lua Snacks.picker.lsp_workspace_symbols() <cr>", desc = "LSP Workspace Symbols" },
		},
	},
}
