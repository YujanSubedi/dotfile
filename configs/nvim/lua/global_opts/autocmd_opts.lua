-- File specific options and keybindings:

-- Create an autocommand group for options
local filetype_opts = vim.api.nvim_create_augroup("filetype_opts", { clear = true })

-- Norg (Neorg)
vim.api.nvim_create_autocmd("FileType", {
	group = filetype_opts,
	pattern = "norg",
	callback = function()
		vim.opt_local.conceallevel = 2
		-- vim.opt_local.concealcursor = "n"
		vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", "<cmd>Neorg index<cr>", { desc = "Go back to index" })
	end,
})

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
	group = filetype_opts,
	pattern = "markdown",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", "<cmd>PeekOpen<cr>", { desc = "Markdown Preview" })
	end,
})

-- Latex
vim.api.nvim_create_autocmd("FileType", {
	group = filetype_opts,
	pattern = "tex",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", "<cmd>VimtexCompile<cr>", { desc = "Compile Latex" })
	end,
})

-- CSV
vim.api.nvim_create_autocmd("FileType", {
	group = filetype_opts,
	pattern = "csv",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", "<cmd>CsvViewToggle<cr>", { desc = "Markdown Preview" })
	end,
})

-- Dart (Flutter)
vim.api.nvim_create_autocmd("FileType", {
	group = filetype_opts,
	pattern = "dart",
	callback = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"n",
			"<A-m>",
			"<cmd>!tmux has-session -t 'flutter' && tmux send-keys -t 'flutter' R<cr>",
			{ desc = "Restart flutter" }
		)
	end,
})
