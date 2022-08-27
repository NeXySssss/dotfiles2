local function plugins(use)
	use { "ray-x/go.nvim" }
end

local function load(modules, defs)
	if defs.treesitter then
		table.insert(modules.treesitter.parsers, "go")
	end

	if defs.lsp then
		modules.lsp.configs["gopls"] = {}
	end

	require("go").setup()
end

return {
	plugins = plugins,

	load = load,
	load_after = { "lsp", "treesitter" },
}
