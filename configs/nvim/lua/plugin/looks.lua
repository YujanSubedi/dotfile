return {
	-- Color theme
	-- { "olimorris/onedarkpro.nvim" },
	-- { "folke/tokyonight.nvim" },
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
	-- { "NLKNguyen/papercolor-theme" },
	-- { "catppuccin/nvim", name = "catppuccin"},
	-- { "bluz71/vim-nightfly-colors", name = "nightfly" },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		init = function()
			vim.cmd.colorscheme("rose-pine")
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end,
	},
	{ "norcalli/nvim-colorizer.lua",
		config = function()
			require'colorizer'.setup()
		end,
	},
	-- Treesitter for languages
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			-- ensure_installed = "all",
			ensure_installed = { "c", "cpp", "lua", "bash", "python" },
			ignore_install = { "org", "latex", "norg" },
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
	-- Auto set indent
	{ "tpope/vim-sleuth" },
	-- Todo Highlighting
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	-- Hide .env vars
	{
		"laytan/cloak.nvim",
		config = function()
			require("cloak").setup({
				enabled = true,
				cloak_character = "*",
				highlight_group = "Comment",
				patterns = { { file_pattern = { ".env*" }, cloak_pattern = "=.+" } },
			})
		end,
	},
	-- Show git chnages on file
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
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
	-- Have command line on Center, better highlighting and notification
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- presets = {
			-- bottom_search = true, -- use a classic bottom cmdline for search
			-- command_palette = true, -- position the cmdline and popupmenu together
			-- long_message_to_split = true, -- long messages will be sent to a split
			-- inc_rename = false, -- enables an input dialog for inc-rename.nvim
			-- lsp_doc_border = false, -- add a border to hover docs and signature help
			-- },
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
}
