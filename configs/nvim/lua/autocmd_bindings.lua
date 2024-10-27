-- File specific config

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
