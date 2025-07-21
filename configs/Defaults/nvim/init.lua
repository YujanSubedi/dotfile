-- Include nvim options, keybindings, statusline, and autocommands
require("global_opts.settings")
require("global_opts.keybindings")
require("global_opts.functions")
require("global_opts.statusline")
require("global_opts.autocmd_opts")

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({ spec = { { import = "plugins" } } })
vim.keymap.set("n", "<leader>ml", "<cmd>Lazy<CR>", { desc = "Lazy Install" })
