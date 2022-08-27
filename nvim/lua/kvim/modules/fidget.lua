local function plugins(use)
	use { "j-hui/fidget.nvim" }
end

local function load(modules, defs)
	require("fidget").setup {
		text = {
			spinner = "dots",
		},
	}
end

return {
	depends = { "lsp" },
	plugins = plugins,

	load = load,
	load_after = { "lsp" },
}
