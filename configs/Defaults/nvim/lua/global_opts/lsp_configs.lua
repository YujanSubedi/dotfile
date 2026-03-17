vim.lsp.config("lua_ls", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })

vim.lsp.config("clangd_c", {
	cmd = { "clangd" },
	filetypes = { "c" },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git",
	},
	capabilities = { textDocument = { completion = { editsNearCursor = true } } },
})

vim.lsp.config("clangd_cpp", {
	cmd = { "clangd" },
	filetypes = { "cpp" },
	init_options = { fallbackFlags = { "--std=c++23" } },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git",
	},
	capabilities = { textDocument = { completion = { editsNearCursor = true } } },
})

vim.lsp.enable({ "clangd_c", "clangd_cpp" })
