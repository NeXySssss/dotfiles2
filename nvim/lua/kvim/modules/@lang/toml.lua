local function load(modules, defs)
	if defs.treesitter then
		table.insert(modules.treesitter.parsers, "toml")
	end

	if defs.lsp then
		modules.lsp.configs["taplo"] = {}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter" },
}
