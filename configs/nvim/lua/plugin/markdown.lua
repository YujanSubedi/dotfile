return {
	-- Markdown
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		config = function()
			vim.g.mkdp_page_title = "${name}"
			vim.g.mkdp_theme = "light"
			vim.g.mkdp_preview_options = {
				mkit = {},
				katex = {},
				uml = {},
				maid = {},
				disable_sync_scroll = 0,
				sync_scroll_type = "middle",
				hide_yaml_meta = 1,
				sequence_diagrams = {},
				flowchart_diagrams = {},
				content_editable = false,
				disable_filename = 1,
				toc = {},
			}
		end,
	},
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
	-- Orgmode
	-- {
	-- 	"nvim-orgmode/orgmode",
	-- 	event = "VeryLazy",
	-- 	ft = { "org" },
	-- 	config = function()
	-- 		-- Setup orgmode
	-- 		require("orgmode").setup({
	-- 			emacs_config = {
	-- 				config_path = "~/.config/emacs/init.el",
	-- 			},
	-- 			org_agenda_files = "~/orgfiles/**/*",
	-- 			org_default_notes_file = "~/orgfiles/refile.org",
	-- 		})

	-- 		-- Note: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
	-- 		-- add ~org~ to ignore_install
	-- 		-- require('nvim-treesitter.configs').setup({
	-- 		--   ensure_installed = 'all',
	-- 		--   ignore_install = { 'org' },
	-- 		-- })
	-- 	end,
	-- },
	-- Neorg
	-- {
	-- 	"nvim-neorg/neorg",
	-- 	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	-- 	version = "*", -- Pin Neorg to the latest stable release
	-- 	config = true,
	-- },
}
