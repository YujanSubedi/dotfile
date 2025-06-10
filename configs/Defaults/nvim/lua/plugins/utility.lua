return {
	-- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth", event = "VeryLazy" },

	-- Auto Pair and show paring
	{ "altermo/ultimate-autopair.nvim", dependencies = { "andymass/vim-matchup" }, event = "VeryLazy", opts = {} },

	-- Auto Complete html tags
	{ "windwp/nvim-ts-autotag", ft = "html", opts = { per_filetype = { ["html"] = { enable_close = true } } } },

	-- Run code Snip
	{
		"michaelb/sniprun",
		branch = "master",
		build = "sh install.sh",
		cmd = "SnipRun",
		keys = {
			{ "<leader>ss", "<cmd>SnipRun<CR>", mode = "v", desc = "[S]nip [R]un visual" },
			{ "<leader>ss", "<cmd>%SnipRun<CR>", desc = "[S]nip [R]un" },
			{ "<leader>sk", "<cmd>SnipClose<CR>", desc = "[S]nip [K]ill" },
		},
		opts = { display = { "Terminal" } },
	},

	-- Code Snippets
	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			local Luasnip = require("luasnip")
			-- Custom snippets
			local custom_snippets = require("snippets.custom_luasnip_snippets")
			Luasnip.add_snippets("asm", custom_snippets.asm)
			Luasnip.add_snippets("c", custom_snippets.c)
			Luasnip.add_snippets("cpp", custom_snippets.cpp)
			Luasnip.add_snippets("rust", custom_snippets.rust)
			Luasnip.add_snippets("verilog", custom_snippets.verilog)
			Luasnip.add_snippets("systemverilog", custom_snippets.systemverilog)
			-- Friendly snippets as dependency
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	-- Autocompletion
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "VeryLazy",
		opts = {
			keymap = {
				-- preset = "enter",
				-- ["<Tab>"] = { "select_next", "fallback" },
				-- ["<S-Tab>"] = { "select_prev", "fallback" },
				["<A-w>"] = { "select_and_accept" },
				["<A-n>"] = { "select_next", "fallback" },
				["<A-N>"] = { "select_prev", "fallback" },
			},
			cmdline = {
				keymap = {
					["<A-w>"] = { "select_and_accept" },
					["<A-n>"] = { "select_next", "fallback" },
					["<A-N>"] = { "select_prev", "fallback" },
				},
			},
			snippets = { preset = "luasnip" },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
		},
	},
}
