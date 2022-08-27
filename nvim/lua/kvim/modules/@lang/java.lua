local function load(modules, defs)
	if defs.treesitter then
		table.insert(modules.treesitter.parsers, "java")
		table.insert(modules.treesitter.parsers, "kotlin")
	end

	if defs.lsp then
		modules.lsp.configs.jdtls = {}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter" },
}
