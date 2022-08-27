local function load(modules, defs)
	if defs.treesitter then
		table.insert(modules.treesitter.parsers, "javascript")
		table.insert(modules.treesitter.parsers, "typescript")
		table.insert(modules.treesitter.parsers, "jsdoc")
	end

	if defs["null-ls"] then
		table.insert(modules.nls.sources, require("null-ls").builtins.diagnostics.eslint)
		table.insert(modules.nls.sources, require("null-ls").builtins.formatting.eslint)
	end

	if defs.lsp then
		modules.lsp.configs.tsserver = {}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter" },
}
