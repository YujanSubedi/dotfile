-- Settings

-- Gobal Settings:
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.zig_fmt_autosave = 0 -- Zig fix
vim.g.matchup_matchparen_offscreen = { method = "popup" }

-- Nvim Options
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.mouse = ""
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignorecase = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.title = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.winminwidth = 10
vim.opt.scrolloff = 10
vim.opt.splitright = true

-- Window only Options
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true
vim.wo.signcolumn = "yes"
vim.wo.foldlevel = 7
vim.wo.linebreak = true
vim.wo.wrap = true
vim.wo.list = true

-- Tabs and Diagnostic Signs
vim.opt.listchars = { tab = "… ", trail = "·", nbsp = "␣" }
-- Define custom diagnostic signs
vim.fn.sign_define("DiagnosticSignError", { text = " " })
vim.fn.sign_define("DiagnosticSignWarn", { text = " " })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌸 " })
vim.fn.sign_define("DiagnosticSignInfo", { text = " " })
-- Define custom Debug signs
vim.fn.sign_define("DapStopped", { text = " " })
vim.fn.sign_define("DapLogPoint", { text = " " })
vim.fn.sign_define("DapBreakpoint", { text = " " })
vim.fn.sign_define("DapBreakpointCondition", { text = " " })
vim.fn.sign_define("DapBreakpointRejected", { text = " " })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
