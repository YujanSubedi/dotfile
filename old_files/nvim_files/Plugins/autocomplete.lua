return {
	-- Code Snippet
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		event = "VeryLazy",
		build = vim.fn.has("win32") ~= 0 and "make install_jsregexp" or nil,
		config = function()
			local Luasnip = require("luasnip")

			-- Custom snippets
			local custom_snippets = require("custom_snippets")
			Luasnip.add_snippets("cpp", custom_snippets.cpp)
			Luasnip.add_snippets("c", custom_snippets.c)
			Luasnip.add_snippets("verilog", custom_snippets.verilog)
			Luasnip.add_snippets("systemverilog", custom_snippets.systemverilog)

			-- Vscode Snippet
			vim.tbl_map(function(type)
				require("luasnip.loaders.from_" .. type).lazy_load()
			end, { "vscode", "snipmate", "lua" })

			-- friendly-snippets - enable standardized comments snippets
			Luasnip.filetype_extend("c", { "cdoc" })
			Luasnip.filetype_extend("sh", { "shelldoc" })
			Luasnip.filetype_extend("cpp", { "cppdoc" })
			Luasnip.filetype_extend("rust", { "rustdoc" })
			Luasnip.filetype_extend("lua", { "luadoc" })
			Luasnip.filetype_extend("python", { "pydoc" })
			Luasnip.filetype_extend("typescript", { "tsdoc" })
			Luasnip.filetype_extend("javascript", { "jsdoc" })
			-- Luasnip.filetype_extend("cs", { "csharpdoc" })
			-- Luasnip.filetype_extend("java", { "javadoc" })
			-- Luasnip.filetype_extend("php", { "phpdoc" })
			-- Luasnip.filetype_extend("kotlin", { "kdoc" })
			-- Luasnip.filetype_extend("ruby", { "rdoc" })
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
		},
		event = "VeryLazy",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup()

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

					-- Tab for next
					-- ["<Tab>"] = cmp.mapping(function(fallback)
					-- 	if cmp.visible() then cmp.select_next_item()
					-- 	elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
					-- 	else fallback() end end, { "i", "s" }),
					--
					-- Shift Tab for previous
					-- ["<S-Tab>"] = cmp.mapping(function(fallback)
					-- 	if cmp.visible() then cmp.select_prev_item()
					-- 	elseif luasnip.jumpable(-1) then luasnip.jump(-1)
					-- 	else fallback() end end, { "i", "s" }),

					-- Enter for completion
					-- ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = false }),
				}),

				-- sources for autocompletion
				sources = { { name = "nvim_lsp" }, { name = "luasnip" }, { name = "buffer" }, { name = "path" } },
			})

			-- Completion within the search
			cmp.setup.cmdline({ "/", "?" }, { sources = { { name = "buffer" } } })

			-- Completion within the commandline
			cmp.setup.cmdline(":", { sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }) })
		end,
	},
}
