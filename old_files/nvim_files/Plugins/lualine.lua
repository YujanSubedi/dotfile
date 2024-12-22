local colors = {
	black = "#1C1E26",
	white = "#6C6F93",
	red = "#F43E5C",
	green = "#09A780",
	blue = "#25B2BC",
	yellow = "#F09383",
	gray = "#E95678",
	darkgray = "#1A1C23",
	lightgray = "#2E303E",
	inactivegray = "#1C1E26",
}

local custom_status_bar_theme = {
	normal = {
		a = { bg = colors.gray, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.white },
	},
	insert = {
		a = { bg = colors.blue, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.white },
	},
	visual = {
		a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.white },
	},
	replace = {
		a = { bg = colors.red, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.white },
	},
	command = {
		a = { bg = colors.green, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.darkgray, fg = colors.white },
	},
	inactive = {
		a = { bg = colors.inactivegray, fg = colors.lightgray, gui = "bold" },
		b = { bg = colors.inactivegray, fg = colors.lightgray },
		c = { bg = colors.inactivegray, fg = colors.lightgray },
	},
}

return {
	-- NOTE: Status Bar
	 	{
	 		"nvim-lualine/lualine.nvim",
	 		dependencies = { "nvim-tree/nvim-web-devicons" },
	 		config = function()
	 			require("lualine").setup({
	 				options = {
	 					icons_enabled = true,
	 					theme = custom_status_bar_theme,
	 					component_separators = { left = "|", right = "|" },
	 					section_separators = { left = "", right = "" },
	 					disabled_filetypes = {
	 						statusline = {},
	 						winbar = {},
	 					},
	 					ignore_focus = {},
	 					always_divide_middle = true,
	 					globalstatus = false,
	 				},
	 				sections = {
	 					lualine_a = { "mode" },
	 					lualine_b = { "filename" },
	 					lualine_c = { "branch", "diff" },
	 					lualine_x = { "encoding", "diagnostics" },
	 					lualine_y = { "filetype", "progress" },
	 					lualine_z = { "location" },
	 				},
	 				inactive_sections = {
	 					lualine_a = {},
	 					lualine_b = {},
	 					lualine_c = { "filename" },
	 					lualine_x = { "location" },
	 					lualine_y = {},
	 					lualine_z = {},
	 				},
	 				tabline = {},
	 				winbar = {},
	 				inactive_winbar = {},
	 				extensions = {},
	 			})
	 		end,
	 	},
}
