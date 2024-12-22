return {
	-- Config nvim with lua
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = { library = { { path = "luvit-meta/library", words = { "vim%.uv" } } } },
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
					jsonc = { "prettier" },
				},
				format_on_save = { lsp_fallback = true, async = false, timeout_ms = 300 },
			})

			vim.keymap.set({ "n", "v" }, "<leader>mf", function()
				conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
			end, { desc = "Format the current buffer" })
		end,
	},
}
