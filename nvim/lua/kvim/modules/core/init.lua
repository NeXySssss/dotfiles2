local function plugins(use)
	use { "antoinemadec/FixCursorHold.nvim" }
end

local function preload(modules)
	require("kvim.modules.core.options")(modules)
	require("kvim.modules.core.mappings")(modules)
end

return {
	depends = { "utils" },
	plugins = plugins,

	preload = preload,
	preload_after = { "utils" },
}
