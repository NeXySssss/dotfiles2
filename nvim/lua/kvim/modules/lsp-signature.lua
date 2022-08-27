local function plugins(use)
	use { "ray-x/lsp_signature.nvim" }
end

local function load()
	require("lsp_signature").setup {
		hint_enable = false,
	}
end

return {
	depends = { "lsp" },
	plugins = plugins,

	load = load,
	load_after = { "lsp" },
}
