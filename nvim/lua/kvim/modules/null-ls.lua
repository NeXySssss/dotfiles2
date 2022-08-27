local function plugins(use)
	use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } }
end

local function preload(modules)
	modules.nls = {
		sources = {},
	}
end

local function postload(modules)
	local nls = require("null-ls")

	nls.setup {
		sources = modules.nls.sources,
	}
end

return {
	depends = { "lsp" },
	plugins = plugins,

	preload = preload,
	preload_after = { "core", "lsp" },
	postload = postload,
}
