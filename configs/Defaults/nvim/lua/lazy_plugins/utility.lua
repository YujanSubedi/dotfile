return {
	-- Session Management
	{
		"rmagatti/auto-session",
		event = "VimEnter",
		opts = {
			purge_after_minutes = 1440,
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		},
		keys = { { "<leader>ss", "<cmd>AutoSession search<cr>", desc = "Auto[S]ession [S]earch" } },
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VimEnter",
		config = function()
			local installed_filetypes = require("nvim-treesitter").get_installed()
			if installed_filetypes and next(installed_filetypes) then
				vim.api.nvim_create_autocmd("FileType", {
					pattern = installed_filetypes,
					callback = function()
						vim.treesitter.start()
					end,
				})
			else
				local parsers = { "vim", "vimdoc", "lua", "luadoc", "markdown", "markdown_inline", "query", "diff" } -- Defaults
				vim.list_extend(parsers, { "gitcommit", "git_rebase", "gitignore", "git_config", "bash", "zsh" }) -- Git and bash
				vim.list_extend(parsers, { "asm", "c", "cpp", "rust", "zig", "toml", "make", "cmake", "meson" }) -- C Cpp Rust Zig
				vim.list_extend(parsers, { "python", "typst", "html", "css", "json" })                           -- Other Parsers
				require("nvim-treesitter").install(parsers)
			end
		end,
	},

	-- Code Snippets
	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			-- Custom snippets
			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	-- Autocompletion
	{
		"saghen/blink.cmp",
		version = "1.*",
		event = "VeryLazy",
		opts = {
			keymap = {
				-- preset = "enter",
				["<Tab>"] = { "select_and_accept" },
				["<M-w>"] = { "select_and_accept" },
				["<M-n>"] = { "select_next", "fallback" },
				["<M-N>"] = { "select_prev", "fallback" },
			},
			cmdline = {
				keymap = {
					["<M-w>"] = { "select_and_accept" },
					["<M-n>"] = { "select_next", "fallback" },
					["<M-N>"] = { "select_prev", "fallback" },
				},
			},
			snippets = { preset = "luasnip" },
			sources = { default = { "lsp", "path", "snippets", "buffer" } },
		},
	},
}
