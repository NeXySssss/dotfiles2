local function load(modules, defs)
	if defs.treesitter then
		table.insert(modules.treesitter.parsers, "yaml")
	end

	if defs.lsp then
		modules.lsp.configs["yamlls"] = {
			settings = {
				yaml = {
					schemaStore = {
						enable = true,
						url = "https://www.schemastore.org/api/json/catalog.json",
					},
				},
			},
		}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter" },
}
