return {
	-- Color theme
	-- { "olimorris/onedarkpro.nvim" },
	-- { "folke/tokyonight.nvim" },
	-- { "loctvl842/monokai-pro.nvim" },
	-- { "Mofiqul/dracula.nvim" },
	-- { "jsit/toast.vim" },
	-- { "jacoborus/tender.vim" },
	-- { "EdenEast/nightfox.nvim" },
	-- { "oxfist/night-owl.nvim" },
	-- { "ofirgall/ofirkai.nvim" },
	-- { "VonHeikemen/midnight-owl.vim" },
	-- { "Mofiqul/vscode.nvim" },
	-- { "Rigellute/rigel" },
	-- { "jabuti-theme/jabuti-nvim" },
	-- { "NLKNguyen/papercolor-theme" },
	-- { "catppuccin/nvim", name = "catppuccin"},
	-- { "bluz71/vim-nightfly-colors", name = "nightfly" },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		init = function()
			vim.cmd.colorscheme("rose-pine")
			-- Transparency
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
	config = function()
		require'colorizer'.setup()
	end,
},
{
	"max397574/colortils.nvim",
	cmd = "Colortils",
	config = function()
		require("colortils").setup()
	end,
}
}
