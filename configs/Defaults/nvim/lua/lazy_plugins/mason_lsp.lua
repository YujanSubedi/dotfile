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

	-- linters and formatters
	{
		"creativenull/efmls-configs-nvim",
		event = "VeryLazy",
		config = function()
			-- linters
			local shellcheck = require("efmls-configs.linters.shellcheck")

			-- formatters
			local stylua = require("efmls-configs.formatters.stylua")
			local shfmt = require("efmls-configs.formatters.shfmt")
			local beautysh = require("efmls-configs.formatters.beautysh")
			local prettypst = require("efmls-configs.formatters.prettypst")
			local gersemi = require("efmls-configs.formatters.gersemi")
			-- local prettier = require("efmls-configs.formatters.prettier")

			local languages = {
				lua = { stylua },
				bash = { shellcheck, beautysh, shfmt },
				sh = { shellcheck, beautysh, shfmt },
				zsh = { beautysh },
				typst = { prettypst },
				cmake = { gersemi },
			}

			local efmls_config = {
				filetypes = vim.tbl_keys(languages),
				settings = { rootMarkers = { ".git/" }, languages = languages },
				init_options = { documentFormatting = true, documentRangeFormatting = true },
			}

			vim.lsp.config("efm", vim.tbl_extend("force", efmls_config, { cmd = { "efm-langserver" } }))
		end,
	},

	-- Language Server Protocol
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = { "neovim/nvim-lspconfig", "creativenull/efmls-configs-nvim" },
		opts = {
			automatic_installation = false,
			ensure_installed = { "efm", "lua_ls" },
			automatic_enable = { exclude = { "clangd" } },
		},
	},
}
