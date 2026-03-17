vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
	{ src = "https://github.com/echasnovski/mini.diff" },
	{ src = "https://github.com/echasnovski/mini.ai" },
	{ src = "https://github.com/echasnovski/mini.surround" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp", name = "blink", version = "v1.7.0" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/folke/todo-comments.nvim" },
})

require("rose-pine").setup({ styles = { transparency = true } })
vim.cmd("colorscheme rose-pine")

require("mini.ai").setup({ n_lines = 25 })
require("mini.surround").setup({ n_lines = 25 })
require("mini.diff").setup({
	view = { style = "sign", signs = { add = "+", change = "~", delete = "_" } },
})

require("which-key").setup({})
require("todo-comments").setup({})
require("noice").setup({
	cmdline = {
		format = {
			search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
			search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
		},
	},
})
-- return {
-- 	-- Rose-pine Colortheme
-- 	{
-- 		"rose-pine/neovim",
-- 		event = "VeryLazy",
-- 		name = "rose-pine",
-- 		init = function()
-- 			vim.cmd("colorscheme rose-pine")
-- 		end,
-- 	},
--
-- 	-- Mini Git diff signs, Arround and Surround
-- 	{
-- 		"echasnovski/mini.diff",
-- 		dependencies = {
-- 			{ "echasnovski/mini.ai", opts = { n_lines = 25 } },
-- 			{ "echasnovski/mini.surround", opts = { n_lines = 25 } },
-- 		},
-- 		event = "VeryLazy",
-- 		opts = { view = { style = "sign", signs = { add = "+", change = "~", delete = "_" } } },
-- 		keys = { { "<leader>gm", "<cmd>lua MiniDiff.toggle_overlay()<cr>", desc = "Toggle Git MiniDiff View" } },
-- 	},
--
-- 	-- Looks of command mode, which key and highlights
-- 	{
-- 		"folke/noice.nvim",
-- 		dependencies = {
-- 			{ "nvim-tree/nvim-web-devicons" },
-- 			{ "MunifTanjim/nui.nvim" },
-- 			{ "nvim-lua/plenary.nvim" },
-- 			{ "folke/which-key.nvim", opts = {} },
-- 			{ "folke/todo-comments.nvim", opts = {} },
-- 		},
-- 		event = "VeryLazy",
-- 		opts = {
-- 			cmdline = {
-- 				format = {
-- 					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
-- 					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
-- 				},
-- 			},
-- 		},
-- 	},
-- }
--
