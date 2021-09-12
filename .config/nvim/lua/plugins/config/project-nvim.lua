require("project_nvim").setup({
	manual_mode = true,
	ignore_lsp = { "null-ls", "lua", "sumneko_lua" },
	patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "packages", "src" },
})
