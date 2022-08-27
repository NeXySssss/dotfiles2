local function plugins(use, use_rocks, defs)
	use { "L3MON4D3/LuaSnip" }

	if defs.cmp then
		use { "saadparwaiz1/cmp_luasnip" }
	end
end

local function load(modules, defs)
	if defs.cmp then
		table.insert(modules.cmp.sources, { name = "luasnip", label = "LuaSnip" })
	end
end

return {
	plugins = plugins,

	load = load,
}
