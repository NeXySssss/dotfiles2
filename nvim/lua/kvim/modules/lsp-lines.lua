local function plugins(use)
	use { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" }
end

local function load()
	require("lsp_lines").setup()

	vim.diagnostic.config {
		virtual_text = false,
	}
end

return {
	depends = { "lsp" },
	plugins = plugins,

	load = load,
	load_after = { "lsp" },
}
