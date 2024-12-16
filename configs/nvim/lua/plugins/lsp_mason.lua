return {
	-- Mason Installer
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		keys = { { "<leader>mm", "<cmd>Mason<CR>", desc = "Go to [M]ason [I]nstall" } },
		opts = {
			ui = { icons = { package_installed = "󱄅 ", package_pending = " ", package_uninstalled = "󱌣 " } },
		},
	},

	-- Linter
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				sh = { "shellcheck" },
				html = { "htmlhint" },
				json = { "jsonlint" },
				markdown = { "markdownlint" },
			}

			-- Autogroup for linting
			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>mg", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		event = "VeryLazy",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					sh = { "beautysh", "shfmt" },
					lua = { "stylua" },
					python = { "yapf" },
					markdown = { "prettier" },
					javascript = { "prettier" },
					typescript = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
				},
				format_on_save = { lsp_fallback = true, async = false, timeout_ms = 300 },
			})

			vim.keymap.set({ "n", "v" }, "<leader>mf", function()
				conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
			end, { desc = "Format the current buffer" })
		end,
	},

	-- Language Server Protocol
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
		},
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
					"zls", -- zig
					"gopls", -- golang
					"cssls", -- css
					"ts_ls", -- js/ts
					"dockerls", -- docker
				},
				handlers = {
					function(server_name)
						lspconfig[server_name].setup({})
					end,
					-- Install by rustup
					lspconfig.rust_analyzer.setup({
						settings = { ["rust-analyzer"] = { cargo = { allFeatures = true } } },
					}),
				},
			})
			vim.cmd("LspStart") -- Start Server
		end,
	},
}
