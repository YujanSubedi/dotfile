return {
	-- Leetcode integration
	{
		"kawre/leetcode.nvim",
		cmd = "Leet",
		keys = { { "<leader>tl", ":Leet ", desc = "Leetcode Commands" } },
		opts = { lang = "rust" },
	},

	-- Auto Complete html tags
	{
		"windwp/nvim-ts-autotag",
		ft = "html",
		opts = { per_filetype = { ["html"] = { enable_close = true } } },
	},

	-- Highlight colors
	{
		"brenoprata10/nvim-highlight-colors",
		ft = "css",
		cmd = "HighlightColors",
		opts = {},
	},

	-- Neorg
	-- {
	-- 	"nvim-neorg/neorg",
	-- 	ft = "norg", -- only load on norg files
	-- 	cmd = "Neorg",
	-- 	keys = { { "<leader>ni", "<cmd>Neorg index<cr>", desc = "Go to Neorg notes Index" } },
	-- 	opts = {
	-- 		load = {
	-- 			["core.defaults"] = {},
	-- 			["core.concealer"] = {},
	-- 			["core.dirman"] = { config = { workspaces = { notes = "~/notes" }, default_workspace = "notes" } },
	-- 		},
	-- 	},
	-- },

	--  Markdown Render and Preview
	{
		"toppair/peek.nvim",
		dependencies = {
			"MeanderingProgrammer/render-markdown.nvim",
			{ "SCJangra/table-nvim", opts = { mappings = { delete_column = "<A-S-d>" } } },
		},
		ft = "markdown", -- only load on markdown files
		build = "deno task --quiet build:fast",
		config = function()
			local peek = require("peek")
			peek.setup({ app = "zen-browser" })
			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("filetype_opts", { clear = true }),
				pattern = "markdown",
				callback = function()
					vim.api.nvim_buf_set_keymap(0, "n", "<M-m>", "<cmd>PeekOpen<cr>", { desc = "Markdown Preview" })
				end,
			})
		end,
	},

	--  Typst Preview
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst", -- only load on typst files
		version = "1.*",
		opts = {},
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("filetype_opts", { clear = true }),
				pattern = "typst",
				callback = function()
					vim.api.nvim_buf_set_keymap(0, "n", "<M-m>", "<cmd>TypstPreview<cr>", { desc = "Typst Preview" })
				end,
			})
		end,
	},

	-- Latex
	-- {
	-- 	"lervag/vimtex",
	-- 	ft = "tex", -- only load on tex files
	-- 	config = function()
	-- 		vim.g.vimtex_view_method = "zathura"
	--
	-- 		vim.api.nvim_create_autocmd("FileType", {
	-- 			group = vim.api.nvim_create_augroup("filetype_opts", { clear = true }),
	-- 			pattern = "tex",
	-- 			callback = function()
	-- 				vim.api.nvim_buf_set_keymap(0, "n", "<M-m>", "<cmd>VimtexCompile<cr>", { desc = "Compile Latex" })
	-- 			end,
	-- 		})
	-- 	end,
	-- },
}
