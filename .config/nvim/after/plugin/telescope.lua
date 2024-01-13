local builtin = require('telescope.builtin')
vim.keymap.set('n', '<A-f>', builtin.find_files, {})
vim.keymap.set('n', '<leader>f', builtin.git_files, {})
vim.keymap.set('n', '<A-g>', function()
	builtin.grep_string({search = vim.fn.input("Grep > ")});
end)
