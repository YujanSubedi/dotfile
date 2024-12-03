return {
	-- Latex
	{
		"lervag/vimtex",
		ft = "tex", -- only load on tex files
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end,
	},

	--  Markdown Render and Preview
	{
		"toppair/peek.nvim",
		dependencies = {
			"MeanderingProgrammer/render-markdown.nvim",
			{ "SCJangra/table-nvim", opts = {} },
			{ "jghauser/follow-md-links.nvim" },
		},
		ft = "markdown", -- only load on markdown files
		build = "deno task --quiet build:fast",
		config = function()
			local peek = require("peek")
			peek.setup({
				app = "zen-browser",
				-- theme = "light",
			})
			vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
			vim.api.nvim_create_user_command("PeekClose", peek.close, {})
			-- vim.keymap.set("n", "<leader>tm", "<cmd>PeekOpen<cr>", { desc = "Markdown Preview" })
		end,
	},

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
				["core.dirman"] = {
					config = {
						workspaces = { notes = "~/notes" },
						default_workspace = "notes",
					},
				},
			},
		},
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
