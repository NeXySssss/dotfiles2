local function plugins(use)
	use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }
end

local function load(modules, defs)
	if defs.lsp then
		modules.lsp.capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
	end

	if defs.treesitter then
		require("ufo").setup {
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		}
	else
		require("ufo").setup()
	end

	modules.utils.set_maps {
		{ "n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" } },
		{ "n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" } },
	}
end

return {
	depends = { "utils" },
	plugins = plugins,

	load = load,
	load_after = { "lsp", "treesitter" },
}
