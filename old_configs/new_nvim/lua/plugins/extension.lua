vim.pack.add({
	{ src = "https://github.com/toppair/peek.nvim" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },
	{ src = "https://github.com/windwp/nvim-ts-autotag" },
	{ src = "https://github.com/brenoprata10/nvim-highlight-colors" },
	{ src = "https://github.com/nvim-neorg/neorg" },
})

-- require("neorg").setup({
-- 	load = {
-- 		["core.defaults"] = {},
-- 		["core.concealer"] = {},
-- 		["core.dirman"] = { config = { workspaces = { notes = "~/notes" }, default_workspace = "notes" } },
-- 	},
-- })
vim.keymap.set("n", "<leader>ni", "<cmd>Neorg index<CR>", { desc = "Neorg Index" })
require("nvim-ts-autotag").setup({ per_filetype = { ["html"] = { enable_close = false } } })

-- File specific options and keybindings:

-- Create an autocommand group for options
local filetype_opts = vim.api.nvim_create_augroup("filetype_opts", { clear = true })

-- Norg (Neorg)
vim.api.nvim_create_autocmd("FileType", {
	group = filetype_opts,
	pattern = "norg",
	callback = function()
		vim.opt_local.conceallevel = 2
		-- vim.opt_local.concealcursor = "n"
		vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", "<cmd>Neorg index<cr>", { desc = "Go back to index" })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	group = filetype_opts,
	pattern = "html",
	callback = function()
		require("nvim-ts-autotag").setup({ per_filetype = { ["html"] = { enable_close = false } } })
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	group = filetype_opts,
	pattern = "css",
	callback = function()
		require("nvim-highlight-colors").setup({})
	end,
})

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
	group = filetype_opts,
	pattern = "markdown",
	callback = function()
		local peek = require("peek")
		peek.setup({ app = "zen-browser" })
		-- peek.setup({ app = "zen-browser", theme = "light" })
		vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
		vim.api.nvim_create_user_command("PeekClose", peek.close, {})
		vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", "<cmd>PeekOpen<cr>", { desc = "Markdown Preview" })
	end,
})

-- Latex
vim.api.nvim_create_autocmd("FileType", {
	group = filetype_opts,
	pattern = "tex",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", "<cmd>VimtexCompile<cr>", { desc = "Compile Latex" })
	end,
})
-- 	{ "windwp/nvim-ts-autotag", ft = "html", opts = { per_filetype = { ["html"] = { enable_close = true } } } },
-- return {
-- 	-- Auto Complete html tags
--
-- 	-- Highlight colors
-- 	{ "brenoprata10/nvim-highlight-colors", ft = "css", cmd = "HighlightColors", opts = {} },
--
-- 	-- Hide .env vars
-- 	{
-- 		"laytan/cloak.nvim",
-- 		ft = "sh",
-- 		keys = { { "<leader>ct", "<cmd>CloakToggle<cr>", desc = "[C]oak [T]oggle" } },
-- 		opts = {
-- 			enabled = true,
-- 			cloak_character = "*",
-- 			highlight_group = "Comment",
-- 			patterns = { { file_pattern = { ".env*" }, cloak_pattern = "=.+" } },
-- 		},
-- 	},
--
-- 	-- Latex
-- 	{
-- 		"lervag/vimtex",
-- 		ft = "tex", -- only load on tex files
-- 		config = function()
-- 			vim.g.vimtex_view_method = "zathura"
-- 		end,
-- 	},
--
-- 	-- Leetcode integration
-- 	{
-- 		"kawre/leetcode.nvim",
-- 		cmd = "Leet",
-- 		keys = { { "<leader>tl", ":Leet ", desc = "Leetcode Commands" } },
-- 		opts = { lang = "rust" },
-- 	},
--
-- 	-- Neorg
-- 	{
-- 		"nvim-neorg/neorg",
-- 		ft = "norg", -- only load on norg files
-- 		cmd = "Neorg",
-- 		keys = { { "<leader>ni", "<cmd>Neorg index<cr>", desc = "Go to Neorg notes Index" } },
-- 		opts = {
-- 			load = {
-- 				["core.defaults"] = {},
-- 				["core.concealer"] = {},
-- 				["core.dirman"] = { config = { workspaces = { notes = "~/notes" }, default_workspace = "notes" } },
-- 			},
-- 		},
-- 	},
--
-- 	--  Markdown Render and Preview
-- 	{
-- 		"toppair/peek.nvim",
-- 		dependencies = {
-- 			"MeanderingProgrammer/render-markdown.nvim",
-- 			{ "SCJangra/table-nvim", opts = { mappings = { delete_column = "<A-S-d>" } } },
-- 		},
-- 		ft = "markdown", -- only load on markdown files
-- 		build = "deno task --quiet build:fast",
-- 		config = function()
-- 			local peek = require("peek")
-- 			peek.setup({ app = "zen-browser" })
-- 			-- peek.setup({ app = "zen-browser", theme = "light" })
-- 			vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
-- 			vim.api.nvim_create_user_command("PeekClose", peek.close, {})
-- 		end,
-- 	},
-- }
--
