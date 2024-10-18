-- File specific config

-- Set keybindings for C and C++ files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "c", "cpp" },
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "i", '"', '""<Esc>i', { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, "i", "'", "''<Esc>i", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, "i", "[", "[]<Esc>i", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, "i", "{", "{}<Esc>i", { noremap = true, silent = true })
		-- vim.api.nvim_buf_set_keymap(0, "i", "{", "{<CR>}<Esc>O", { noremap = true, silent = true })
	end,
})

-- Set keybindings for Rust files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "rust" },
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "i", '"', '""<Esc>i', { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, "i", "'", "''<Esc>i", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, "i", "[", "[]<Esc>i", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, "i", "{", "{}<Esc>i", { noremap = true, silent = true })
	end,
})

-- Set keybinding for Python files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		-- vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", ":!kitty --hold python %<CR>", { noremap = true, silent = true })
	end,
})

-- Set keybinding for Markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
	end,
})

-- Set keybinding for Latex files
vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", ":VimtexCompile<CR>", { noremap = true, silent = true })
	end,
})

-- Set keybindings for javascript and typescript files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "javascript", "typescript" },
	callback = function()
		vim.api.nvim_buf_set_keymap(0, "i", '"', '""<Esc>i', { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, "i", "'", "''<Esc>i", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, "i", "[", "[]<Esc>i", { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(0, "i", "{", "{<CR>}<Esc>O", { noremap = true, silent = true })
	end,
})
