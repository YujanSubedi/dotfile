return {
	-- Rest Api
	-- { "rest-nvim/rest.nvim", ft = "http" },

	-- Csv table
	-- {
	-- 	"hat0uma/csvview.nvim",
	-- 	cmd = "CsvViewToggle",
	-- 	opts = { view = { display_mode = "border" } },
	-- },

	-- Latex
	-- {
	-- 	"lervag/vimtex",
	-- 	ft = "tex", -- only load on tex files
	-- 	config = function()
	-- 		vim.g.vimtex_view_method = "zathura"
	-- 	end,
	-- },

	-- Leetcode integration
	{
		"kawre/leetcode.nvim",
		cmd = "Leet",
		keys = { { "<leader>tl", ":Leet ", desc = "Leetcode Commands" } },
		opts = { lang = "rust" },
	},

	-- Flutter
	-- {
	-- 	"nvim-flutter/flutter-tools.nvim",
	-- 	ft = "dart", -- only load on dart files
	-- 	config = function()
	-- 		-- Auto reload on save
	-- 		vim.api.nvim_create_autocmd("BufWritePost", {
	-- 			group = vim.api.nvim_create_augroup("flutter reload", { clear = true }),
	-- 			pattern = "*.dart",
	-- 			callback = function()
	-- 				vim.fn.system("tmux has-session -t 'flutter' && tmux send-keys -t 'flutter' r")
	-- 			end,
	-- 		})
	-- 	end,
	-- },

	-- Neorg
	{
		"nvim-neorg/neorg",
		ft = "norg", -- only load on norg files
		cmd = "Neorg",
		keys = { { "<leader>ni", "<cmd>Neorg index<cr>", desc = "Go to Neorg notes Index" } },
		opts = {
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = { config = { workspaces = { notes = "~/notes" }, default_workspace = "notes" } },
			},
		},
	},

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
			-- peek.setup({ app = "zen-browser", theme = "light" })
			vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
			vim.api.nvim_create_user_command("PeekClose", peek.close, {})
		end,
	},

	-- Orgmode
	-- {
	-- 	"nvim-orgmode/orgmode",
	-- 	dependencies = { "akinsho/org-bullets.nvim" },
	-- 	ft = "org", -- only load on org files
	-- 	config = function()
	-- 		-- Setup orgmode
	-- 		require("org-bullets").setup()
	-- 		require("orgmode").setup({
	-- 			emacs_config = {
	-- 				config_path = "~/.config/emacs/init.el",
	-- 			},
	-- 			-- org_agenda_files = "~/orgfiles/**/*",
	-- 			-- org_default_notes_file = "~/orgfiles/refile.org",
	-- 		})
	-- 	end,
	-- },
}
