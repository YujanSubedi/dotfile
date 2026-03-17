-- Highlight Yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Function to get directories based on parameters
local function toggle_lsp()
	local lsp_enabled = vim.lsp.buf_is_attached()

	if lsp_enabled then
		vim.cmd("LspStop")
	else
		vim.cmd("LspStart")
	end
end

-- Function to format current buffer
local function format_current_buffer()
	if vim.lsp.buf_is_attached(0) then
		vim.notify("Formating Buffer")
		vim.lsp.buf.format({ timeout_ms = 3000 })
	else
		vim.notify("No lsp attached")
	end
end

-- Function to jump to next diagnostics
local function jump_to_next_diagonistics()
	vim.diagnostic.jump({ count = 1, float = true })
end

-- Function to update packages from vim.pack
local function update_vim_pack()
	-- delete Inactive
	vim.iter(vim.pack.get())
			:filter(function(x)
				return not x.active
			end)
			:map(function(x)
				return x.spec.name
			end)
			:totable()
	-- update installed
	vim.pack.update()
end

-- Lsp Keybindings
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Variable" })
vim.keymap.set("n", "<leader>ts", toggle_lsp, { desc = "Toggle Language Server" })
vim.keymap.set({ "n", "v" }, "<leader>mf", format_current_buffer, { desc = "Format buffer" })
vim.keymap.set({ "n", "v" }, "<C-k><C-d>", format_current_buffer, { desc = "Format buffer" })
vim.keymap.set({ "n", "v", "s", "i" }, "<M-d>", jump_to_next_diagonistics, { desc = "Jump to next Diagnostic" })
--
-- Update Install vim.pack
vim.keymap.set("n", "<leader>mS", update_vim_pack, { desc = "Sync Packages by vim.pack" })
