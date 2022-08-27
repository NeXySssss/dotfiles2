local function plugins(use)
	use { "simrat39/rust-tools.nvim" }
end

local function postload(modules, defs)
	if defs.treesitter then
		table.insert(modules.treesitter.parsers, "rust")
	end

	if defs.lsp then
		require("rust-tools").setup {
			-- HACK: Ugly code duplication, running in postload
			server = {
				on_attach = function(...)
					for _, fn in ipairs(modules.lsp.on_attaches) do
						fn(...)
					end
				end,
				capabilities = modules.lsp.capabilities,
			},
		}
	end
end

return {
	plugins = plugins,

	postload = postload,
	postload_after = { "lsp", "treesitter" },
}
