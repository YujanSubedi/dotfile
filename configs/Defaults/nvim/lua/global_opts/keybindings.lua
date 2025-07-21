-- Keybindings:

-- Basic keybinding
vim.keymap.set("n", "<A-q>", vim.cmd.Ex, { desc = "Go back to the directory" })
vim.keymap.set({ "v", "n" }, "Y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>o", "<C-o>", { desc = "Return to previous jump pos" })
vim.keymap.set("n", "<leader>q", "<cmd>q!<Cr>", { desc = "Exit Current buffer" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<Cr>", { desc = "Exit in all the buffers" })
vim.keymap.set("n", "<leader>dm", "<cmd>delmarks!<cr>", { desc = "Delete all marks" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Stop highlighting" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Alt Keybindings
-- vim.keymap.set("n", "<A-n>", "*", { desc = "Find next" })
-- vim.keymap.set("n", "<A-N>", "#", { desc = "Find previous" })
vim.keymap.set({ "n", "v", "s", "i" }, "<A-x>", "<Esc>:", { desc = "Change to Command Mode" })
vim.keymap.set({ "n", "v", "s", "i" }, "<A-`>", "<cmd>!footclient &<CR>", { desc = "Spawn new terminal" })
vim.keymap.set({ "n", "v", "s", "i" }, "<A-=>", "<Esc>i<C-r>=", { desc = "Calculator" })

-- Centering
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
-- vim.keymap.set("n", "n", "nzz", { desc = "Find next" })
-- vim.keymap.set("n", "N", "Nzz", { desc = "Find prev" })

-- visual Tab
vim.keymap.set("v", ">", ">gv", { desc = "Add tab" })
vim.keymap.set("v", "<", "<gv", { desc = "Remove tab" })

-- alt arrow move highlighted line to other in visual mode
vim.keymap.set("v", "<A-Up>", [[:m '<-2<CR>gv=gv]], { desc = "Move Highlighted Text Upwards" })
vim.keymap.set("v", "<A-Down>", [[:m '>+1<CR>gv=gv]], { desc = "Move Highlighted Text Downwards" })

-- Window Split Managements
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move focus to left Window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move focus to right Window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move focus to lower Window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move focus to upper Window" })
vim.keymap.set("n", "<leader>ww", "<C-w>", { desc = "Same as <C-w>" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window Vertical" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split window Horizontal" })
vim.keymap.set("n", "<leader><Tab>", "<C-w>w", { desc = "Move focus in Splitted Windows" })
vim.keymap.set("n", "<A-i>", "<C-w>w", { desc = "Move focus in Splitted Windows" })
vim.keymap.set("n", "<A-o>", "<C-w>W", { desc = "Move focus in Splitted Windows" })

-- Lsp Keybindings
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Variable" })

-- Diagnostic keybinding
vim.keymap.set({ "n", "v", "s", "i" }, "<A-d>", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Jump to next Diagnostic with floating window" })

-- Toggle settings
vim.keymap.set("n", "<leader>eie", "<cmd>lua vim.lsp.inlay_hint.enable(true)<cr>", { desc = "Enable inlay hint" })
vim.keymap.set("n", "<leader>eid", "<cmd>lua vim.lsp.inlay_hint.enable(false)<cr>", { desc = "Disable inlay hint" })
vim.keymap.set("n", "<leader>ese", "<cmd>lua vim.opt_local.spell=true<cr>", { desc = "Enable Spelling" })
vim.keymap.set("n", "<leader>esd", "<cmd>lua vim.opt_local.spell=false<cr>", { desc = "Disable Spelling" })
vim.keymap.set("n", "<leader>ece", "<cmd>set colorcolumn=80<cr>", { desc = "Enable colorcolumn" })
vim.keymap.set("n", "<leader>ecd", "<cmd>set colorcolumn=<cr>", { desc = "Disable colorcolumn" })
