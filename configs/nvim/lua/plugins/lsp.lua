return {
	-- Auto set indent
	{ "tpope/vim-sleuth" },

	-- Language Server Protocol
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local mason = require("mason")
			local lspconfig = require("lspconfig")
			local lsp_util = require("lspconfig.util")
			local mason_lspconfig = require("mason-lspconfig")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					map( "<leader>dw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
					-- map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					-- map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
				end,
			})

			mason.setup()
			mason_lspconfig.setup({
				ensure_installed = {
					"lua_ls", -- lua
					"clangd", -- c/c++
					"pyright", -- python
					"rust_analyzer", --rust
					"ts_ls", -- javascript/typescript
					"texlab", -- latex
					"gopls", -- golang
					"zls", -- zig
				},

				handlers = {
					function(server_name)
						lspconfig[server_name].setup({})
					end,
					["lua_ls"] = function()
						lspconfig.lua_ls.setup({
							settings = {
								Lua = {
									diagnostics = {
										globals = { "vim", "it", "describe", "before_each", "after_each" },
									},
								},
							},
						})
					end,
					["rust_analyzer"] = function()
						lspconfig.rust_analyzer.setup({
							root_dir = lsp_util.root_pattern("Cargo.toml"),
							settings = {
								["rust-analyzer"] = {
									cargo = {
										allFeatures = true,
									},
								},
							},
						})
					end,
				},
			})
		end,
	},

	-- Snippet Courtesy of @Zeioth, 
	{
		"L3MON4D3/LuaSnip",
		build = vim.fn.has "win32" ~= 0 and "make install_jsregexp" or nil,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"benfowler/telescope-luasnip.nvim",
		},
		config = function(_, opts)
			if opts then require("luasnip").config.setup(opts) end
			vim.tbl_map(
				function(type) require("luasnip.loaders.from_" .. type).lazy_load() end,
				{ "vscode", "snipmate", "lua" }
			)
			-- friendly-snippets - enable standardized comments snippets
			require("luasnip").filetype_extend("typescript", { "tsdoc" })
			require("luasnip").filetype_extend("javascript", { "jsdoc" })
			require("luasnip").filetype_extend("lua", { "luadoc" })
			require("luasnip").filetype_extend("python", { "pydoc" })
			require("luasnip").filetype_extend("rust", { "rustdoc" })
			require("luasnip").filetype_extend("cs", { "csharpdoc" })
			require("luasnip").filetype_extend("java", { "javadoc" })
			require("luasnip").filetype_extend("c", { "cdoc" })
			require("luasnip").filetype_extend("cpp", { "cppdoc" })
			require("luasnip").filetype_extend("php", { "phpdoc" })
			require("luasnip").filetype_extend("kotlin", { "kdoc" })
			require("luasnip").filetype_extend("ruby", { "rdoc" })
			require("luasnip").filetype_extend("sh", { "shelldoc" })
		end,
	},
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths in commands
			"hrsh7th/cmp-nvim-lsp", -- source for file system paths in commands
			"hrsh7th/cmp-cmdline", -- source for file system paths in commands
			"saadparwaiz1/cmp_luasnip", -- for lua autocompletion
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			-- Completion within the buffer
			cmp.setup({
				-- completion = { completeopt = "menu,menuone,preview,noselect" },
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<A-N>"] = cmp.mapping.select_prev_item(), -- previous suggestion
					["<A-n>"] = cmp.mapping.select_next_item(), -- next suggestion
					["<A-w>"] = cmp.mapping.confirm({ select = true }),

					["<CR>"] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					},

					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif require("luasnip").expand_or_jumpable() then
							require("luasnip").expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif require("luasnip").jumpable(-1) then
							require("luasnip").jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				-- sources for autocompletion
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- snippets
					{ name = "buffer" }, -- text within current buffer
					{ name = "path" }, -- file system paths
				},
			})

			-- Completion within the search
			cmp.setup.cmdline({ '/', '?' }, {
				-- mapping = cmp.mapping.preset.cmdline({
				-- 	["<A-N>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				-- 	["<A-n>"] = cmp.mapping.select_next_item(), -- next suggestion
				-- 	["<A-w>"] = cmp.mapping.confirm({ select = true }),
				-- }),
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Completion within the commandline
			cmp.setup.cmdline(':', {
				-- mapping = cmp.mapping.preset.cmdline({
				-- 	["<A-N>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				-- 	["<A-n>"] = cmp.mapping.select_next_item(), -- next suggestion
				-- 	["<A-w>"] = cmp.mapping.confirm({ select = true }),
				-- }),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
						{ name = 'cmdline' }
					}),
				matching = { disallow_symbol_nonprefix_matching = false }
			})
		end
	},

	-- Auto complete brackets
	{
		'm4xshen/autoclose.nvim',
		config = function()
			require("autoclose").setup()
		end
	},
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup()
			vim.keymap.set("n", "<leader>rn", ":IncRename ")
			vim.keymap.set("n", "<leader>rn", ":IncRename ", { desc = "[R]ename selected word" })
		end,
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	}
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
}

