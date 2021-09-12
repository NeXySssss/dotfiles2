local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.markdown = {
	install_info = {
		url = "https://github.com/ikatyang/tree-sitter-markdown",
		files = { "src/parser.c", "src/scanner.cc" },
	},
	filetype = "markdown",
}

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"markdown",
		"javascript",
		"c_sharp",
		"rust",
		"go",
		"html",
		"css",
		"json",
		"yaml",
		"vue",
		"cpp",
		"dart",
		"c",
		"bash",
		"java",
		"kotlin",
		"regex",
		"jsdoc",
		"typescript",
		"svelte",
		"tsx",
	},
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
	indent = { enable = true },
	autopairs = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
