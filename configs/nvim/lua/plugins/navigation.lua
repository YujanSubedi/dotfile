return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-tree/nvim-web-devicons",
			"debugloop/telescope-undo.nvim",
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
			pcall(require("telescope").load_extension, "undo")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp Telescope" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps Telescope" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles Telescope" })
			vim.keymap.set("n", "<leader>fs", builtin.builtin, { desc = "[F]ind [S]elect Telescope" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "[F]ind current [W]ord Telescope" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep Telescope" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "[F]ind [D]iagnostics Telescope" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "[F]ind [R]esume Telescope" })
			vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat) Telescope' })
			vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "[F]ind [C]olorScheme Telescope" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers Telescope" })
			vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "[G]it [F]ile Search Telescope" })
			vim.keymap.set("n", "<leader>gg", builtin.git_bcommits, { desc = "[G]it [G]et Buffer Commits Telescope" })
			vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "[G]it [S]tatus Telescope" })
			vim.keymap.set("n", "<A-f>", builtin.find_files, { desc = "[F]ind [F]iles Telescope" })
			vim.keymap.set("n", "<A-g>", builtin.live_grep, { desc = "[F]ind by [G]rep Telescope" })
			vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "[U]ndo Tree Telescope" })
			vim.keymap.set("n", "<A-u>", "<cmd>Telescope undo<cr>", { desc = "[U]ndo Tree Telescope" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
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
		end,
	},

	-- Harpon For saving buffer state
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()
			vim.keymap.set("n", "<A-a>", function() harpoon:list():add() end, { desc = "Add to Harpoon buffers" })
			vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end, { desc = "Goto Harpoon buffer 1" })
			vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end, { desc = "Goto Harpoon buffer 2" })
			vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end, { desc = "Goto Harpoon buffer 3" })
			vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end, { desc = "Goto Harpoon buffer 4" })
			vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end, { desc = "Goto Harpoon buffer 5" })
			vim.keymap.set("n", "<A-6>", function() harpoon:list():select(6) end, { desc = "Goto Harpoon buffer 6" })
			vim.keymap.set("n", "<A-7>", function() harpoon:list():select(7) end, { desc = "Goto Harpoon buffer 7" })
			vim.keymap.set("n", "<A-8>", function() harpoon:list():select(8) end, { desc = "Goto Harpoon buffer 8" })
			vim.keymap.set("n", "<A-9>", function() harpoon:list():select(9) end, { desc = "Goto Harpoon buffer 9" })
			vim.keymap.set("n", "<A-0>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Show all Harpoon buffers" })
		end,
	}
}
