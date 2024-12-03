return {
	-- Flutter
	{
		"nvim-flutter/flutter-tools.nvim",
		ft = "dart",
		keys = {
			{ "<leader>rf", "<cmd>!tmux send-keys -t 'flutter' r<cr>", desc = "[R]eload [F]lutter" },
			{ "<leader>rF", "<cmd>!tmux send-keys -t 'flutter' R<cr>", desc = "[R]estart [F]lutter" },
		},
	},

	-- Linter
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				-- python = { "ruff" },
				sh = { "shellcheck" },
				html = { "htmlhint" },
				json = { "jsonlint" },
				markdown = { "markdownlint" },
			}
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
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 300,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>mf", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format the current buffer" })
		end,
	},

	-- Mason Installer
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		event = "VeryLazy",
		keys = { { "<leader>mm", "<cmd>Mason<CR>", desc = "Go to [M]ason [I]nstall" } },

		config = function()
			require("mason").setup({
				ui = {
					icons = { package_installed = "󱄅 ", package_pending = " ", package_uninstalled = "󱌣 " },
				},
			})

			-- Language Server Protocol
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd", -- c/c++
					"rust_analyzer", --rust
					"lua_ls", -- lua
					"pyright", -- python
					"texlab", -- latex
					"zls", -- zig
					"gopls", -- golang
					"cssls", -- css
					"ts_ls", -- js/ts
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
				},
			})

			-- Start Server
			vim.cmd("LspStart")
		end,
	},
}
