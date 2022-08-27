local function load(modules, defs)
	if defs.treesitter then
		table.insert(modules.treesitter.parsers, "css")
		table.insert(modules.treesitter.parsers, "scss")
	end

	if defs.lsp then
		modules.lsp.configs.cssls = {}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter" },
}
