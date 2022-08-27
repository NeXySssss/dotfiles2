local function plugins(use)
	use { "numToStr/Comment.nvim" }
end

local function load()
	require("Comment").setup {
		mappings = {
			basic = true,
			extra = true,
			extended = true,
		},
	}
end

return {
	plugins = plugins,

	load = load,
}
