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

			vim.keymap.set("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Go to Mason install" })

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
}
