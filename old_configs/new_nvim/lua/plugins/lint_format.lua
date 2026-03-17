vim.pack.add({
	{ src = "https://github.com/folke/lazydev.nvim" },
	{ src = "https://github.com/folke/snacks.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/MunifTanjim/nui.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/williamboman/mason.nvim" },
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/saghen/blink.cmp", name = "blink", version = "v1.7.0" },
})

require("lazydev").setup({
	library = { { path = "luvit-meta/library", words = { "vim%.uv" } } },
})

local conform = require("conform")
conform.setup({
	formatters_by_ft = {
		-- asm = { "asmfmt" },
		-- sh = { "beautysh", "shfmt" },
		lua = { "stylua" },
		python = { "yapf" },
		-- markdown = { "markdownlint" },
		-- javascript = { "prettier" },
		-- typescript = { "prettier" },
		-- html = { "prettier" },
		-- jsx = { "prettier" },
	},
})
vim.keymap.set({ "n", "v" }, "<leader>mf", function()
	conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
end, { desc = "Format the current buffer" })

-- return {
-- 	-- Config nvim with lua
-- 	{
-- 		"folke/lazydev.nvim",
-- 		ft = "lua", -- only load on lua files
-- 		opts = { library = { { path = "luvit-meta/library", words = { "vim%.uv" } } } },
-- 	},
--
-- 	-- Linter
-- 	{
-- 		"mfussenegger/nvim-lint",
-- 		event = "VeryLazy",
-- 		config = function()
-- 			local lint = require("lint")
-- 			lint.linters_by_ft = {
-- 				sh = { "shellcheck" },
-- 				make = { "checkmake" },
-- 				html = { "htmlhint" },
-- 				-- markdown = { "markdownlint" },
-- 				-- javascript = { "eslint_d" },
-- 				-- typescript = { "eslint_d" },
-- 			}
--
-- 			-- Autogroup for linting
-- 			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
-- 			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
-- 				group = lint_augroup,
-- 				callback = function()
-- 					lint.try_lint()
-- 				end,
-- 			})
--
-- 			vim.keymap.set("n", "<leader>mg", function()
-- 				lint.try_lint()
-- 			end, { desc = "Trigger linting for current file" })
-- 		end,
-- 	},
--
-- 	-- Formatter
-- 	{
-- 		"stevearc/conform.nvim",
-- 		event = "VeryLazy",
-- 		config = function()
-- 			local conform = require("conform")
--
-- 			conform.setup({
-- 				formatters_by_ft = {
-- 					-- asm = { "asmfmt" },
-- 					-- sh = { "beautysh", "shfmt" },
-- 					lua = { "stylua" },
-- 					python = { "yapf" },
-- 					-- markdown = { "markdownlint" },
-- 					-- javascript = { "prettier" },
-- 					-- typescript = { "prettier" },
-- 					-- html = { "prettier" },
-- 					-- jsx = { "prettier" },
-- 				},
-- 				-- format_on_save = { lsp_fallback = true, async = false, timeout_ms = 375 },
-- 			})
--
-- 			vim.keymap.set({ "n", "v" }, "<leader>mf", function()
-- 				conform.format({ lsp_fallback = true, async = false, timeout_ms = 1000 })
-- 			end, { desc = "Format the current buffer" })
-- 		end,
-- 	},
-- }
--
