return {
	-- Color theme
	-- { "olimorris/onedarkpro.nvim" },
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
	-- { "sainnhe/sonokai" },
	-- { 'olivercederborg/poimandres.nvim' },
	-- { "NLKNguyen/papercolor-theme" },
	-- { "rebelot/kanagawa.nvim" },
	-- { "catppuccin/nvim",                name = "catppuccin" },
	-- { "bluz71/vim-nightfly-colors",     name = "nightfly" },

	-- Rose-pine Colortheme
	{ "rose-pine/neovim", name = "rose-pine",
		init = function ()
			vim.cmd.colorscheme("rose-pine")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		end
	},

	-- Tokyonight Colortheme
	{ "folke/tokyonight.nvim",
	-- 	init = function ()
	-- 		vim.cmd.colorscheme("tokyonight")
	-- 	end
	},

	-- Highlight colors on buffer
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require 'colorizer'.setup()
		end,
	},

	-- Find color coding
	{
		"max397574/colortils.nvim",
		cmd = "Colortils",
		config = function()
			require("colortils").setup()
		end,
	},

}
