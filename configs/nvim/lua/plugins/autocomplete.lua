return {
	-- Auto complete brackets
	{
		'm4xshen/autoclose.nvim',
		config = function()
			require("autoclose").setup()
		end
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
			local Luasnip = require("luasnip")
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

					-- Enter and Tab for completion
					-- ["<CR>"] = cmp.mapping.confirm {
					-- 	behavior = cmp.ConfirmBehavior.Insert,
					-- 	select = true,
					-- },

				-- 	["<Tab>"] = cmp.mapping(function(fallback)
				-- 		if cmp.visible() then
				-- 			cmp.select_next_item()
				-- 		elseif require("luasnip").expand_or_jumpable() then
				-- 			require("luasnip").expand_or_jump()
				-- 		else
				-- 			fallback()
				-- 		end
				-- 	end, { "i", "s" }),
				--
				-- 	["<S-Tab>"] = cmp.mapping(function(fallback)
				-- 		if cmp.visible() then
				-- 			cmp.select_prev_item()
				-- 		elseif require("luasnip").jumpable(-1) then
				-- 			require("luasnip").jump(-1)
				-- 		else
				-- 			fallback()
				-- 		end
				-- 	end, { "i", "s" }),
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
				sources = {
					{ name = 'buffer' }
				}
			})

			-- Completion within the commandline
			cmp.setup.cmdline(':', {
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
						{ name = 'cmdline' }
					}),
			})
		end
	},

}
