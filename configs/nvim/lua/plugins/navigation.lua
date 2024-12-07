return {
	-- Enhanced f, F, t, T and remap s to serarch
	{
		"folke/flash.nvim",
		keys = {
			{ "<a-s>", mode = { "n", "x", "o" }, "<cmd>lua require('flash').jump()<cr>", desc = "Flash" },
			{ "<a-S>", mode = { "n", "x", "o" }, "<cmd>lua require('flash').treesitter()<cr>", desc = "Flash Tree" },
			{ "r", mode = "o", "<cmd>lua require('flash').remote()<cr>", desc = "Remote Flash" },
			{ "R", mode = { "o", "x" }, "<cmd>lua require('flash').treesitter_search()<cr>", desc = "Tree Search" },
			{ "<c-s>", mode = { "c" }, "<cmd>lua require('flash').toggle()<cr>", desc = "Toggle Flash Search" },
		},
		opts = {},
	},

	-- Quickfix and Symbols jumps
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		keys = {
			{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
			{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
			{ "<leader>ta", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer (Trouble)" },
		},
	},

	-- Telescope for navigation
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
			-- pcall(require("telescope").load_extension, "noice")

			-- Telescope keymaps
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp Telescope" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps Telescope" })
			vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "[F]ind Recent Files Telescope" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles Telescope" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord Telescope" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep Telescope" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics Telescope" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume Telescope" })
			vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "[F]ind [C]olorScheme Telescope" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers Telescope" })
			vim.keymap.set("n", "<A-f>", builtin.find_files, { desc = "[F]ind [F]iles Telescope" })
			vim.keymap.set("n", "<A-g>", builtin.live_grep, { desc = "[F]ind by [G]rep Telescope" })
			vim.keymap.set("n", "<leader>gg", builtin.git_bcommits, { desc = "Git Buffer Commits" })
			vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Git Status" })

			-- Additional telescope keymaps
			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(
					require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
				)
			end, { desc = "[/] Fuzzily search in current buffer" })
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })

			-- Lsp keymaps with help of telescope
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
					map("gr", builtin.lsp_references, "[G]oto [R]eferences")
					map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
					map("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
					map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
					map("<leader>dw", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
					-- map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					-- map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
				end,
			})
		end,
	},
}
