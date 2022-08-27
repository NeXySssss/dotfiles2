local function plugins(use)
	use { "norcalli/nvim-colorizer.lua" }
end

local function load()
	require("colorizer").setup {
		"css",
		"javascript",
		"lua",
	}
end

return {
	disable = true,
	plugins = plugins,

	load = load,
}
