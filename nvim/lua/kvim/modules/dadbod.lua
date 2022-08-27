local function plugins(use, use_rocks, defs)
	use { "tpope/vim-dadbod" }
	use { "kristijanhusak/vim-dadbod-ui" }

	if defs.cmp then
		use { "kristijanhusak/vim-dadbod-completion" }
	end
end

local function load(modules, defs)
	if defs.cmp then
		table.insert(modules.cmp.sources, { name = "vim-dadbod-completion", label = "DadBod" })
	end
end

return {
	plugins = plugins,

	load = load,
}
