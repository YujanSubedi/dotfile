vim.pack.add({
	{ src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/andymass/vim-matchup" },
	{ src = "https://github.com/altermo/ultimate-autopair.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
	{ src = "https://github.com/folke/noice.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/saghen/blink.cmp", name = "blink", version = "v1.7.0" },
})

require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,

	-- List of parsers to ignore installing (or "all")
	ignore_install = { "javascript" },

	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,

		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		disable = { "c", "rust" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
})

require("ultimate-autopair").setup({})
require("treesitter-context").setup({ separator = "—" })

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
require("luasnip.loaders.from_vscode").lazy_load()
require("blink.cmp").setup({
	keymap = {
		-- preset = "enter",
		-- ["<Tab>"] = { "select_next", "fallback" },
		-- ["<S-Tab>"] = { "select_prev", "fallback" },
		["<A-w>"] = { "select_and_accept" },
		["<A-n>"] = { "select_next", "fallback" },
		["<A-N>"] = { "select_prev", "fallback" },
	},
	cmdline = {
		keymap = {
			["<A-w>"] = { "select_and_accept" },
			["<A-n>"] = { "select_next", "fallback" },
			["<A-N>"] = { "select_prev", "fallback" },
		},
	},
	snippets = { preset = "luasnip" },
	sources = { default = { "lsp", "path", "snippets", "buffer" } },
})

-- return {
-- 	-- Code highlighting , Auto Pair, show paring and context
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		dependencies = {
-- 			"andymass/vim-matchup",
-- 			{ "altermo/ultimate-autopair.nvim", opts = {} },
-- 			{ "nvim-treesitter/nvim-treesitter-context", opts = { separator = "—" } },
-- 		},
-- 		event = "VeryLazy",
-- 		build = ":TSUpdate",
-- 		opts = {
-- 			auto_install = true,
-- 			ignore_install = { "org", "latex", "verilog" },
-- 			ensure_installed = { "rust", "cpp", "c", "bash", "asm", "lua", "python", "norg", "markdown" },
-- 			highlight = { enable = true, additional_vim_regex_highlighting = { "ruby" } },
-- 			indent = { enable = true, disable = { "ruby" } },
-- 		},
-- 		config = function(_, opts)
-- 			require("nvim-treesitter.install").prefer_git = true
-- 			require("nvim-treesitter.configs").setup(opts)
-- 		end,
-- 	},
--
-- 	-- Code Snippets
-- 	{
-- 		"L3MON4D3/LuaSnip",
-- 		event = "VeryLazy",
-- 		dependencies = { "rafamadriz/friendly-snippets" },
-- 		config = function()
-- 			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
-- 			require("luasnip.loaders.from_vscode").lazy_load()
-- 		end,
-- 	},
--
-- 	-- Autocompletion
-- 	{
-- 		"saghen/blink.cmp",
-- 		version = "1.*",
-- 		event = "VeryLazy",
-- 		opts = {
-- 			keymap = {
-- 				-- preset = "enter",
-- 				-- ["<Tab>"] = { "select_next", "fallback" },
-- 				-- ["<S-Tab>"] = { "select_prev", "fallback" },
-- 				["<A-w>"] = { "select_and_accept" },
-- 				["<A-n>"] = { "select_next", "fallback" },
-- 				["<A-N>"] = { "select_prev", "fallback" },
-- 			},
-- 			cmdline = {
-- 				keymap = {
-- 					["<A-w>"] = { "select_and_accept" },
-- 					["<A-n>"] = { "select_next", "fallback" },
-- 					["<A-N>"] = { "select_prev", "fallback" },
-- 				},
-- 			},
-- 			snippets = { preset = "luasnip" },
-- 			sources = { default = { "lsp", "path", "snippets", "buffer" } },
-- 		},
-- 	},
-- }
--
