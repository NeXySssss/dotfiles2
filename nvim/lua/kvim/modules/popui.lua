local function plugins(use)
	use { "RishabhRD/popfix" }
	use { "hood/popui.nvim" }
end

local function load()
	vim.ui.select = require("popui.ui-overrider")
	vim.ui.input = require("popui.input-overrider")
end

return {
	plugins = plugins,

	load = load,
}
