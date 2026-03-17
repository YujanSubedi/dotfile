-- Settings

-- Gobal Settings:
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.zig_fmt_autosave = 0 -- Zig fix
vim.g.matchup_matchparen_offscreen = { method = "popup" }

-- Nvim Options
vim.opt.termguicolors = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.errorbells = false
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
vim.opt.winborder = "rounded"

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
vim.diagnostic.config({
	virtual_text = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "󰌸 ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

-- Define custom Debug signs
vim.fn.sign_define("DapStopped", { text = " " })
vim.fn.sign_define("DapLogPoint", { text = " " })
vim.fn.sign_define("DapBreakpoint", { text = " " })
vim.fn.sign_define("DapBreakpointCondition", { text = " " })
vim.fn.sign_define("DapBreakpointRejected", { text = " " })
