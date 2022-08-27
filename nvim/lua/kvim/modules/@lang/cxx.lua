local function load(modules, defs)
	if defs.treesitter then
		table.insert(modules.treesitter.parsers, "c")
		table.insert(modules.treesitter.parsers, "cpp")
	end

	if defs.lsp then
		modules.lsp.configs.clangd = {}
	end
end

return {
	load = load,
	load_after = { "lsp" },
}
