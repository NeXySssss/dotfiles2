local function plugins(use, use_rocks, defs)
	use { "neovim/nvim-lspconfig" }

	if defs.cmp then
		use { "hrsh7th/cmp-nvim-lsp" }
	end
end

local function preload(modules, defs)
	modules.lsp = {
		configs = {},
		on_attaches = {
			function(_, bufnr)
				require("kvim.modules.lsp.mappings")(modules, bufnr)
			end,
		},
		capabilities = vim.lsp.protocol.make_client_capabilities(),
	}
end

local function load(modules, defs)
	if defs.cmp then
		modules.lsp.capabilities = require("cmp_nvim_lsp").update_capabilities(modules.lsp.capabilities)

		table.insert(modules.cmp.sources, 1, { name = "nvim_lsp", label = "LSP" })
	end
end

local function postload(modules)
	local lspconfig = require("lspconfig")

	local defaults = {
		on_attach = function(...)
			for _, fn in ipairs(modules.lsp.on_attaches) do
				fn(...)
			end
		end,
		capabilities = modules.lsp.capabilities,
	}

	for server, config in pairs(modules.lsp.configs) do
		lspconfig[server].setup(vim.tbl_extend("force", defaults, config))
	end
end

return {
	depends = { "utils" },
	plugins = plugins,

	preload = preload,
	preload_after = { "utils" },
	load = load,
	postload = postload,
}
