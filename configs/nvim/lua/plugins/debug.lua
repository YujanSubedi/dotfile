return {
	-- Replace word in the current directory
	{
		"smjonas/inc-rename.nvim",
		config = function()
			vim.keymap.set("n", "<leader>rn", ":IncRename ", { desc = "[R]ename selected word" })
		end,
	},

	-- Show function input type
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts) require 'lsp_signature'.setup(opts) end
	},

	-- Config nvim
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},

	-- Run code Snip
	{
		"michaelb/sniprun",
		branch = "master",
		-- build = "sh install.sh",
		config = function()
			require("sniprun").setup({})
			vim.keymap.set("v", "<leader>ss", ":SnipRun<CR>", { desc = "[S]nip [R]un selection" })
			vim.keymap.set("n", "<leader>ss", ":%SnipRun<CR>", { desc = "[S]nip [R]un buffer" })
			vim.keymap.set("n", "<leader>sk", ":SnipClose<CR>", { desc = "[S]nip [C]lose" })
		end,
	},

	-- Quickfix
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
