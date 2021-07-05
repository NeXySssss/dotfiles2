local feline = require("feline")
local components = require("plugins/feline/components")

feline.setup({
	properties = {
		force_inactive = {
			filetypes = {
				"NvimTree",
				"packer",
				"CHADTree",
				"startify",
				"fugitive",
				"fugitiveblame",
				"qf",
				"help",
				"Trouble",
			},
			buftypes = { "terminal" },
			bufnames = {},
		},
	},
	components = {
		left = {
			active = {
				components.vi_mode,
				components.file_info,
				components.file_size,
				components.position,
				components.diagnostic_errors,
				components.diagnostic_warnings,
				components.diagnostic_hints,
				components.diagnostic_info,
				components.lsp_messages,
			},
			inactive = { components.vi_mode },
		},
		mid = { active = {}, inactive = {} },
		right = {
			active = {
				components.git_branch,
				components.git_diff_added,
				components.git_diff_changed,
				components.git_diff_removed,
				components.line_percentage,
				components.scroll_bar,
			},
			inactive = { components.file_type },
		},
	},
})
