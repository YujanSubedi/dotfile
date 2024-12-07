-- File specific keybindings

-- Define file patterns with commands and descriptions
local file_autocmd = {
	norg = { command = "<cmd>Neorg index<cr>", desc = "Go to index File" },
	markdown = { command = "<cmd>PeekOpen<cr>", desc = "Run Markdown Preview" },
	tex = { command = "<cmd>VimtexCompile<cr>", desc = "Compile LaTeX Document" },
	dart = {
		command = "<cmd>!tmux has-session -t 'flutter' && tmux send-keys -t 'flutter' R<cr>",
		desc = "Restart Flutter",
	},
}

-- Create an autocommand group
local file_augroup = vim.api.nvim_create_augroup("filetype_bindings", { clear = true })

-- Map filetype with respective command
for filetype, mapping in pairs(file_autocmd) do
	vim.api.nvim_create_autocmd("FileType", {
		group = file_augroup,
		pattern = filetype,
		callback = function()
			vim.api.nvim_buf_set_keymap(0, "n", "<A-m>", mapping.command, { desc = mapping.desc, noremap = true })
		end,
	})
end
