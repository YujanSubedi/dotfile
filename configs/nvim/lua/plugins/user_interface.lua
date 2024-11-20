return{
	-- Have command line on Center, better highlighting and notification
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			presets = {
				-- inc_rename = true, -- enables an input dialog for inc-rename.nvim
				-- bottom_search = true, -- use a classic bottom cmdline for search
				-- command_palette = true, -- position the cmdline and popupmenu together
				-- long_message_to_split = true, -- long messages will be sent to a split
				-- lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		}
	},

	-- Show keybinding complitions
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			plugins = {
				presets = {
					operators = true, -- adds help for operators like d, y, ...
					motions = false, -- adds help for motions
					text_objects = true, -- help for text objects triggered after entering an operator
					windows = true, -- default bindings on <c-w>
					nav = true, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = true, -- bindings for prefixed with g
				},
			},
			layout = {
				width = { min = 20, max=30 }, -- min and max width of the columns
				spacing = 2, -- spacing between columns
			},
		},
		keys = { { "<leader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)", },
		},
	},

	-- Twilight and Zen-mode for better focus
	{
		"folke/twilight.nvim",
		dependencies = { "folke/zen-mode.nvim", },
		opts = {
			dimming = {
				context = 20, -- amount of lines we will try to show around the current line
			},
			exclude = {}, -- exclude these filetypes
		},
		config = function()
					vim.keymap.set("n", "<leader>tm", "<cmd>ZenMode<cr>", { desc = "[T]wilight [Z]en Mode" })
	end
	},

	-- Auto resize windows
	{ "anuvyklack/windows.nvim",
		dependencies = {
			"anuvyklack/middleclass",
			"anuvyklack/animation.nvim"
		},
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 5
			vim.o.equalalways = false
			require('windows').setup()
		end
	},
}
