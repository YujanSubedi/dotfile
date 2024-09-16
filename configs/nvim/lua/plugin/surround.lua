return {
	-- Multiple mini tools
	{ 'echasnovski/mini.nvim',
		config = function()
			-- Increase range and options of i/a
			require('mini.ai').setup({
				mappings = {
					around = 'a', inside = 'i',
					around_next = 'an', inside_next = 'in',
					around_last = 'al', inside_last = 'il',
					goto_left = 'g[', goto_right = 'g]',
				},
				n_lines = 25,
			})
			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			-- require('mini.surround').setup ({
			-- 	mappings = {
			-- 		add = 'sa', -- Add surrounding in Normal and Visual modes
			-- 		delete = 'sd', -- Delete surrounding
			-- 		find = 'sf', -- Find surrounding (to the right)
			-- 		find_left = 'sF', -- Find surrounding (to the left)
			-- 		highlight = 'sh', -- Highlight surrounding
			-- 		replace = 'sr', -- Replace surrounding
			-- 		update_n_lines = 'sn', -- Update `n_lines`
			-- 		suffix_last = 'l', -- Suffix to search with "prev" method
			-- 		suffix_next = 'n', -- Suffix to search with "next" method
			-- 	},
			-- 	n_lines = 25,
			-- })
		end
	},
	-- Surround with cs, ys and ds
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({ -- Configuration here, or leave empty to use defaults
			})
		end
	}
}
