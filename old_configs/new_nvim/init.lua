-- Include nvim options, keybindings, statusline, and autocommands
require("global_opts.settings")
require("global_opts.keybindings")
require("global_opts.statusline")
require("global_opts.functions")
-- require("global_opts.autocmd_opts")


require("plugins.user_interface")
require("plugins.navigation")
require("plugins.utility")
require("plugins.mason_lsp")
require("plugins.lint_format")
require("plugins.extension")


--
-- vim.cmd("colorscheme rose-pine")
--
-- require("blink.cmp").setup({
-- 			keymap = {
-- 				-- preset = "enter",
-- 				-- ["<Tab>"] = { "select_next", "fallback" },
-- 				-- ["<S-Tab>"] = { "select_prev", "fallback" },
-- 				["<A-w>"] = { "select_and_accept" },
-- 				["<A-n>"] = { "select_next", "fallback" },
-- 				["<A-N>"] = { "select_prev", "fallback" },
-- 			},
-- 			cmdline = {
-- 				keymap = {
-- 					["<A-w>"] = { "select_and_accept" },
-- 					["<A-n>"] = { "select_next", "fallback" },
-- 					["<A-N>"] = { "select_prev", "fallback" },
-- 				},
-- 			},
-- 			snippets = { preset = "luasnip" },
-- 			sources = { default = { "lsp", "path", "snippets", "buffer" } },
-- })
--
--
-- require("noice").setup({
--   lsp = {
--     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--     override = {
--       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--       ["vim.lsp.util.stylize_markdown"] = true,
--       ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
--     },
--   },
--   -- you can enable a preset for easier configuration
--   presets = {
--     bottom_search = true, -- use a classic bottom cmdline for search
--     command_palette = true, -- position the cmdline and popupmenu together
--     long_message_to_split = true, -- long messages will be sent to a split
--     inc_rename = false, -- enables an input dialog for inc-rename.nvim
--     lsp_doc_border = false, -- add a border to hover docs and signature help
--   },
-- })
