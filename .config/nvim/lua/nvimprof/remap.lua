vim.g.mapleader= " "
vim.keymap.set("v", "Y", '"+y')
vim.keymap.set("n", "<C-d>", vim.cmd.q)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
vim.keymap.set("n", "<leader>Q", vim.cmd.qa)
vim.keymap.set("n", "<A-q>", vim.cmd.Ex)
vim.keymap.set("n", "<A-m>", vim.cmd.MarkdownPreviewToggle)

-- split window of neovim
vim.keymap.set("n", "<leader>v", "<C-w>v")
vim.keymap.set("n", "<leader>s", "<C-w>s")
vim.keymap.set("n", "<leader><Tab>", "<C-w>w")
-- alt arrow will change focus
vim.keymap.set("n", "<A-Up>", "<C-w>k")
vim.keymap.set("n", "<A-Down>", "<C-w>j")
vim.keymap.set("n", "<A-Left>", "<C-w>h")
vim.keymap.set("n", "<A-Right>", "<C-w>l")
-- leader and "hjkl" will change focus
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")
