-- Gobal Settings:
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.mouse = ""
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignorecase = true
vim.opt.list = true
vim.opt.listchars = { tab = "… ", trail = "·", nbsp = "␣" }
-- vim.opt.fillchars = { eob = "-" }
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.showmatch = true
vim.opt.title = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.hlsearch = true
vim.opt.signcolumn = "yes"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
-- vim.opt.mouse = "a"
-- vim.opt.updatetime = 250
-- vim.opt.timeoutlen = 300
-- vim.opt.showmode = false
-- vim.opt.clipboard = 'unnamedplus'
-- vim.opt.breakindent = true
-- vim.opt.undofile = true
-- vim.opt.inccommand = 'split'

vim.g.zig_fmt_autosave = 0 -- Zig fix

-- Define custom diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌸 ", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
