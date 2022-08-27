local function plugins(use)
	use { "NMAC427/guess-indent.nvim" }
end

local function load()
	require("guess-indent").setup {
		auto_cmd = true, -- Set to false to disable automatic execution
		filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
			"netrw",
			"tutor",
		},
		buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
			"help",
			"nofile",
			"terminal",
			"prompt",
		},
	}
end

return {
	plugins = plugins,

	load = load,
}
