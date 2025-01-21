return {
	-- Auto Pair and show paring
	{ "altermo/ultimate-autopair.nvim", dependencies = { "andymass/vim-matchup" }, event = "VeryLazy", opts = {} },

	-- Mason Installer
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		keys = { { "<leader>mm", "<cmd>Mason<CR>", desc = "Go to [M]ason [I]nstall" } },
		opts = {
			ui = { icons = { package_installed = "󱄅 ", package_pending = " ", package_uninstalled = "󱌣 " } },
		},
	},

	-- Code Snippets
	{
		"L3MON4D3/LuaSnip",
		event = "VeryLazy",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			local Luasnip = require("luasnip")
			-- Custom snippets
			local custom_snippets = require("plugins_tweaks.custom_luasnip_snippets")
			Luasnip.add_snippets("asm", custom_snippets.asm)
			Luasnip.add_snippets("c", custom_snippets.c)
			Luasnip.add_snippets("cpp", custom_snippets.cpp)
			Luasnip.add_snippets("verilog", custom_snippets.verilog)
			Luasnip.add_snippets("systemverilog", custom_snippets.systemverilog)
			-- Friendly snippets as dependency
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	-- Autocompletion
	{
		"saghen/blink.cmp",
		version = "*",
		event = "VeryLazy",
		opts = {
			keymap = {
				-- preset = "enter",
				-- ["<Tab>"] = { "select_next", "fallback" },
				-- ["<S-Tab>"] = { "select_prev", "fallback" },
				["<A-w>"] = { "select_and_accept" },
				["<A-n>"] = { "select_next", "fallback" },
				["<A-N>"] = { "select_prev", "fallback" },
			},
			snippets = { preset = "luasnip" },
			sources = { default = { "lsp", "path", "buffer", "snippets" } },
		},
	},

	-- Language Server Protocol
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		event = "VeryLazy",
		config = function()
			local lspconfig = require("lspconfig")
			require("mason-lspconfig").setup({
				automatic_installation = false,
				ensure_installed = {
					"clangd", -- c/c++
					-- "rust_analyzer", --rust
					"lua_ls", -- lua
					"pyright", -- python
					"ruff", -- python linter
					"verible", -- verilog linter
					"texlab", -- latex
					"rnix", -- nix
					"zls", -- zig
					"ols", -- odin
					"gopls", -- golang
					"cssls", -- css
					"ts_ls", -- js/ts
					"dockerls", -- docker
				},
				handlers = {
					function(server_name)
						local capabilities = require("blink.cmp").get_lsp_capabilities()
						lspconfig[server_name].setup({ capabilities = capabilities })
					end,
					-- Install by rustup
					lspconfig.rust_analyzer.setup({
						-- capabilities = require("blink.cmp").get_lsp_capabilities(),
						settings = { ["rust-analyzer"] = { cargo = { allFeatures = true } } },
					}),
				},
			})
			vim.cmd("LspStart") -- Start Server
		end,
	},
}
