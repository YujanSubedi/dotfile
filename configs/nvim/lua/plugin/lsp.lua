return {
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
					map( "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
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
					"gopls", -- golang
					"zls", -- zig
					"texlab", -- latex
					"ts_ls", -- javascript/typescript
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
	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		-- event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths in commands
			"hrsh7th/cmp-nvim-lsp", -- source for file system paths in commands
			"hrsh7th/cmp-cmdline", -- source for file system paths in commands
			"L3MON4D3/LuaSnip", -- snippet engine
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
}
