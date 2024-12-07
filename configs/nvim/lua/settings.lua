-- Gobal Settings:
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.swapfile = false
vim.opt.mouse = ""
-- vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildignorecase = true
vim.opt.list = true
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
vim.o.splitright = true
vim.o.winminwidth = 10
vim.wo.foldlevel = 3
-- vim.wo.conceallevel = 2
-- vim.opt.colorcolumn = "80"
-- vim.opt.updatetime = 250
-- vim.opt.timeoutlen = 300
-- vim.opt.showmode = false
-- vim.opt.clipboard = 'unnamedplus'
-- vim.opt.breakindent = true
-- vim.opt.undofile = true
-- vim.opt.inccommand = 'split'

vim.g.zig_fmt_autosave = 0 -- Zig fix
vim.lsp.inlay_hint.enable() -- Lsp inline_hint
-- vim.lsp.buf.document_highlight()

vim.g.matchup_matchparen_offscreen = { method = "popup" }

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
