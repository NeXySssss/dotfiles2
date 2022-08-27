local function plugins(use)
	use { "lukas-reineke/indent-blankline.nvim" }
end

local function load(modules, defs)
	require("indent_blankline").setup {
		char = "🭰",
		space_char_blankline = " ",
		show_current_context = true,
		show_current_context_start = false,
	}
end

return {
	plugins = plugins,

	load = load,
}
