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

	-- Mason Packages Installer
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		keys = {
			{ "<leader>mtu", "<cmd>MasonToolsUpdate<CR>", desc = "[M]ason [T]ool [U]pdate" },
			{ "<leader>mtc", "<cmd>MasonToolsClean<CR>",  desc = "[M]ason [T]ool [C]lean" },
		},
		config = function()
			-- Language Server Protocols
			local mason_packages = {
				"clangd",    -- c/c++
				"rust_analyzer", --rust
				"lua_ls",    -- lua
				-- "pyright", -- python
				-- "ruff", -- python linter
				-- "zls", -- zig
				-- "ols", -- odin
				-- "gopls", -- golang
				-- "cssls", -- css
				-- "ts_ls", -- js/ts for node
				-- "denols", -- js/ts for deno
				-- "texlab",    -- latex
				-- "jsonls", -- json
				-- "dockerls", -- docker
				-- "rnix", -- nix
				-- "verible", -- verilog linter
			}

			-- debugger adapter protocols
			vim.list_extend(mason_packages, {
				"codelldb", -- c, c++, rust, zig
				-- "bash-debug-adapter", -- bash
				-- "debugpy", -- python
				-- "delve", -- golang
			})

			-- linters
			vim.list_extend(mason_packages, {
				"shellcheck", -- bash
				"checkmake", -- makefile
				"htmlhint", -- html
				-- "markdownlint", -- markdown
				-- "eslint_d" , -- js/ts
			})

			-- formatter
			vim.list_extend(mason_packages, {
				-- "asmfmt", -- assembly
				"shfmt", -- bash
				"beautysh", -- bash
				"stylua", -- lua
				-- "yapf", -- python
				-- "prettier", -- js, ts, html, css, json, markdown
			})

			require("mason-tool-installer").setup({ ensure_installed = mason_packages })
		end,
	},

	-- Language Server Protocol
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			automatic_installation = false,
			ensure_installed = {},
			automatic_enable = {
				exclude = {
					-- "denols",
					-- "rust_analyzer",
				},
			},
		},
	},
}
