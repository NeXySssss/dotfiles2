require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"lua", "javascript", "c_sharp", "rust", "go", "html", "css", "json", "yaml",
  "vue", "cpp", "dart", "c", "bash", "java", "kotlin", "regex", "jsdoc",
  "typescript", "tsx"
	},
	highlight = {enable = true},
	incremental_selection = {enable = true},
	textobjects = {enable = true},
	indent = {enable = true}
}
