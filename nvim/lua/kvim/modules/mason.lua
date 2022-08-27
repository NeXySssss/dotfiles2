local function plugins(use)
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }
end

local function load(modules, defs)
	require("mason").setup()

	if defs.lsp then
		require("mason-lspconfig").setup {
			-- ensure_installed = { "sumneko_lua" },
		}
	end
end

return {
	plugins = plugins,

	load = load,
}
