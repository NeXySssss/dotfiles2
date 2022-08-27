local function plugins(use)
	use { "b0o/SchemaStore.nvim" }
end

local function load(modules, defs)
	if defs.treesitter then
		table.insert(modules.treesitter.parsers, "json")
		table.insert(modules.treesitter.parsers, "jsonc")
		table.insert(modules.treesitter.parsers, "json5")
	end

	if defs.lsp then
		modules.lsp.configs["jsonls"] = {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
				},
			},
		}
	end
end

return {
	plugins = plugins,

	load = load,
	load_after = { "lsp", "treesitter" },
}
