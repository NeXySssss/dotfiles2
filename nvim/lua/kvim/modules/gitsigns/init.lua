local function plugins(use)
	use { "lewis6991/gitsigns.nvim" }
end

local function load(modules)
	require("gitsigns").setup {
		on_attach = function(buffer)
			require("kvim.modules.gitsigns.mappings")(modules, buffer)
		end,
	}
end

return {
	depends = { "utils" },
	plugins = plugins,

	load = load,
	load_after = { "utils" },
}
