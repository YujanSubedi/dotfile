return {
	-- Latex
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- VimTeX configuration goes here, e.g.
			vim.g.vimtex_view_method = "zathura"
		end,
	},

	-- Render markdown
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = {
			'SCJangra/table-nvim',
			ft = 'markdown',
			opts = {},
		},
		opts = {},
	},

	-- Markdown Preview
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			local peek=require("peek")
			peek.setup({
				app = "zen-browser",
				-- theme = "light",
			})
			vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
			vim.api.nvim_create_user_command("PeekClose", peek.close, {})
		end,
	},

	-- Neorg
	{
		"nvim-neorg/neorg",
		lazy = false,
		version = "*",
		config = function()
			require("neorg").setup {
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/notes",
							},
							default_workspace = "notes",
						},
					},
				},
			}
			vim.keymap.set("n", "<leader>ni", ":Neorg index<CR>", { desc = "Go to notes Index" })
			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end,
	},

	-- Orgmode
	-- {
	-- 	"nvim-orgmode/orgmode",
	-- 	dependencies = { "akinsho/org-bullets.nvim" },
	-- 	event = "VeryLazy",
	-- 	ft = { "org" },
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
