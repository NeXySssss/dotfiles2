local function plugins(use) end

local function load(modules, defs)
	if defs.treesitter then
		table.insert(modules.treesitter.parsers, "markdown")
	end
end

return {
	plugins = plugins,

	load = load,
	load_after = { "treesitter" },
}
