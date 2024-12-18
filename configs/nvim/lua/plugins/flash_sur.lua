return {
	-- Surround with cs, ys and ds
	{ "kylechui/nvim-surround", event = "VeryLazy", opts = {} },

	-- Increase range and options of i/a
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = {
			mappings = {
				around = "a",
				inside = "i",
				around_next = "an",
				inside_next = "in",
				around_last = "al",
				inside_last = "il",
				goto_left = "g[",
				goto_right = "g]",
			},
			n_lines = 25,
		},
	},

	-- Enhanced f, F, t, T and remap s to serarch
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<a-s>",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"<a-S>",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
	},
}
