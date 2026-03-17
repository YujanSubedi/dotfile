-- Keybindings:

-- Basic keybinding
vim.keymap.set("n", "<M-q>", vim.cmd.Ex, { desc = "Go back to the directory" })
vim.keymap.set({ "v", "n" }, "Y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "v", "n" }, "D", '"+d', { desc = "Delete to clipboard" })
vim.keymap.set("n", "<leader>o", "<C-o>", { desc = "Return to previous jump pos" })
vim.keymap.set("n", "<leader>i", "<C-i>", { desc = "Return to next jump pos" })
vim.keymap.set("n", "<leader>q", "<cmd>q!<Cr>", { desc = "Exit Current buffer" })
vim.keymap.set("n", "<leader>K", "<cmd>qa!<Cr>", { desc = "Exit in all the buffers" })
vim.keymap.set("n", "<leader>dm", "<cmd>delmarks!<cr>", { desc = "Delete all marks" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Stop highlighting" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Comment line
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "Comment line" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "Comment line" })

-- Alt Keybindings
vim.keymap.set({ "n", "v", "s", "i" }, "<M-x>", "<Esc>:", { desc = "Change to Command Mode" })
vim.keymap.set({ "n", "v", "s", "i" }, "<M-`>", "<cmd>!footclient &<CR>", { desc = "Spawn new terminal" })
vim.keymap.set({ "n", "v", "s", "i" }, "<M-=>", "<Esc>i<C-r>=", { desc = "Calculator" })

-- Tab Management
vim.keymap.set("n", "<M-1>", "<cmd>tabnext 1<CR>", { desc = "Goto Tab 1" })
vim.keymap.set("n", "<M-2>", "<cmd>tabnext 2<CR>", { desc = "Goto Tab 2" })
vim.keymap.set("n", "<M-3>", "<cmd>tabnext 3<CR>", { desc = "Goto Tab 3" })
vim.keymap.set("n", "<M-4>", "<cmd>tabnext 4<CR>", { desc = "Goto Tab 4" })
vim.keymap.set("n", "<M-5>", "<cmd>tabnext 5<CR>", { desc = "Goto Tab 5" })
vim.keymap.set("n", "<M-6>", "<cmd>tabnext 6<CR>", { desc = "Goto Tab 6" })
vim.keymap.set("n", "<M-7>", "<cmd>tabnext 7<CR>", { desc = "Goto Tab 7" })
vim.keymap.set("n", "<M-8>", "<cmd>tabnext 8<CR>", { desc = "Goto Tab 8" })
vim.keymap.set("n", "<M-9>", "<cmd>tabnext $<CR>", { desc = "Goto Last Tab" })

vim.keymap.set("n", "<M-0>", "<cmd>tabnew | Explore<Cr><leader>ff", { remap = true, desc = "Create new tab" })

vim.keymap.set("n", "<C-h>", "<cmd>-tabmove<CR>", { desc = "Move tab prev" })
vim.keymap.set("n", "<C-l>", "<cmd>+tabmove<CR>", { desc = "Move tab next" })

-- Window Split Managements
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move focus to left Window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move focus to right Window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move focus to lower Window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move focus to upper Window" })
vim.keymap.set("n", "<leader>ww", "<C-w>", { desc = "Same as <C-w>" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window Vertical" })
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split window Horizontal" })
vim.keymap.set("n", "<leader><Tab>", "<C-w>w", { desc = "Move focus in Splitted Windows" })
vim.keymap.set("n", "<M-i>", "<C-w>W", { desc = "Move focus in Splitted Windows" })
vim.keymap.set("n", "<M-o>", "<C-w>w", { desc = "Move focus in Splitted Windows" })

-- Centering
-- vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
-- vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
-- vim.keymap.set("n", "n", "nzz", { desc = "Find next" })
-- vim.keymap.set("n", "N", "Nzz", { desc = "Find prev" })

-- visual Tab
vim.keymap.set("v", ">", ">gv", { desc = "Add tab" })
vim.keymap.set("v", "<", "<gv", { desc = "Remove tab" })

-- alt arrow move highlighted line to other in visual mode
vim.keymap.set("v", "<M-Up>", [[:m '<-2<CR>gv=gv]], { desc = "Move Highlighted Text Upwards" })
vim.keymap.set("v", "<M-Down>", [[:m '>+1<CR>gv=gv]], { desc = "Move Highlighted Text Downwards" })

-- Toggle settings
vim.keymap.set("n", "<leader>eie", "<cmd>lua vim.lsp.inlay_hint.enable(true)<cr>", { desc = "Enable inlay hint" })
vim.keymap.set("n", "<leader>eid", "<cmd>lua vim.lsp.inlay_hint.enable(false)<cr>", { desc = "Disable inlay hint" })
vim.keymap.set("n", "<leader>ese", "<cmd>lua vim.opt_local.spell=true<cr>", { desc = "Enable Spelling" })
vim.keymap.set("n", "<leader>esd", "<cmd>lua vim.opt_local.spell=false<cr>", { desc = "Disable Spelling" })
vim.keymap.set("n", "<leader>ece", "<cmd>set colorcolumn=80<cr>", { desc = "Enable colorcolumn" })
vim.keymap.set("n", "<leader>ecd", "<cmd>set colorcolumn=<cr>", { desc = "Disable colorcolumn" })
