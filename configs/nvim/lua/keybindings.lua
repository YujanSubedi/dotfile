-- Keybindings:
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Stop highlighting" })
vim.keymap.set({ "v", "n" }, "Y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set("n", "<A-q>", vim.cmd.Ex, { desc = "Go back to the directory" })
vim.keymap.set("n", "<C-d>", vim.cmd.q, { desc = "Exit Current buffer" })
vim.keymap.set("n", "<leader>o", "<C-o>", { desc = "Go back to previus buffer" })
vim.keymap.set("n", "<leader>q", "<cmd>q!<Cr>", { desc = "Exit Current buffer" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<Cr>", { desc = "Exit in all the buffers" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window Vertical" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split window Horizontal" })
vim.keymap.set("n", "<leader><Tab>", "<C-w>w", { desc = "Move focus in Splitted Windows" })
vim.keymap.set({ "n", "v", "s", "i" }, "<A-x>", "<Esc>:", { desc = "Change to Command Mode" })
vim.keymap.set({ "n", "v", "s", "i" }, "<A-e>", "<Esc>i<C-r>=", { desc = "Evaluate and write given expression" })
vim.keymap.set({ "n", "v", "s", "i" }, "<A-`>", "<Esc>:!footclient &<CR>", { desc = "Spawn new terminal" })

-- alt arrow move highlighted line to other in visual mode
vim.keymap.set("v", "<A-Up>", [[:m '<-2<CR>gv=gv]], { desc = "Move Highlighted Text Upwards" })
vim.keymap.set("v", "<A-Down>", [[:m '>+1<CR>gv=gv]], { desc = "Move Highlighted Text Downwards" })

-- vim.keymap.set("n", "<leader>sc", "<cmd>set colorcolumn=80<cr>", { desc = "set colorcolumn" })
-- vim.keymap.set("n", "<leader>su", "<cmd>set colorcolumn=<cr>", { desc = "unset colorcolumn" })

-- leader and hjkl will change focus in normal mode
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move focus to left Window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move focus to right Window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move focus to lower Window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move focus to upper Window" })

-- kickstart keymap
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>ee", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>ef", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
