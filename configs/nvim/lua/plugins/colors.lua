return {
	-- Rose-pine Colortheme
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = { styles = { transparency = true } },
		init = function()
			vim.cmd("colorscheme rose-pine")
		end,
	},

	-- Highlight colors on buffer
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		config = function()
			require("colorizer").setup()
		end,
	},

	-- Find color coding
	{
		"max397574/colortils.nvim",
		cmd = "Colortils",
		keys = { { "<leader>gc", "<cmd>Colortils<cr>", desc = "[G]et [C]olortils" } },
		opts = {},
	},
}
