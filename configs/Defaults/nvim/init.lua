-- Include nvim options, keybindings, statusline, and autocommands
require("global_opts.settings")
require("global_opts.keybindings")
require("global_opts.functions")
require("global_opts.statusline")
require("global_opts.tabline")
require("global_opts.lsp_configs")

-- Lazy Plugin Manager
vim.pack.add({ "https://github.com/folke/lazy.nvim" })
require("lazy").setup({ spec = { { import = "lazy_plugins" } } })
vim.keymap.set("n", "<leader>ml", "<cmd>Lazy<CR>", { desc = "Lazy Install" })
