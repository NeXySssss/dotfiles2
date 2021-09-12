vim.g.aerial = {
	-- Enum: persist, close, auto, global
	--   persist - aerial window will stay open until closed
	--   close   - aerial window will close when original file is no longer visible
	--   auto    - aerial window will stay open as long as there is a visible
	--             buffer to attach to
	--   global  - same as 'persist', and will always show symbols for the current buffer
	close_behavior = "persist",

	-- Set to false to remove the default keybindings for the aerial buffer
	default_bindings = true,

	-- Enum: prefer_right, prefer_left, right, left
	-- Determines the default direction to open the aerial window. The 'prefer'
	-- options will open the window in the other direction *if* there is a
	-- different buffer in the way of the preferred direction
	default_direction = "prefer_right",

	-- Set to true to only open aerial at the far right/left of the editor
	-- Default behavior opens aerial relative to current window
	placement_editor_edge = true,

	-- The maximum width of the aerial window
	max_width = 32,

	-- The minimum width of the aerial window.
	-- To disable dynamic resizing, set this to be equal to max_width
	min_width = 32,

	-- Whether to open aerial automatically when entering a buffer.
	-- Can also be specified per-filetype as a map (see below)
	open_automatic = false,

	-- If open_automatic is true, only open aerial if the source buffer is at
	-- least this long
	open_automatic_min_lines = 0,

	-- If open_automatic is true, only open aerial if there are at least this many symbols
	open_automatic_min_symbols = 0,

	-- Run this command after jumping to a symbol (false will disable)
	post_jump_cmd = "normal! zz",

	-- Set to false to not update the symbols when there are LSP errors
	update_when_errors = true,

	-- A list of all symbols to display. Set to false to display all symbols.
	filter_kind = {
		"Class",
		"Constructor",
		"Enum",
		"Function",
		"Interface",
		"Method",
		"Struct",
	},
}

-- open_automatic can be specified as a filetype map. For example, the below
-- configuration will open automatically in all filetypes except python and rust
vim.g.aerial = {
	open_automatic = {
		-- use underscore to specify the default behavior
		["_"] = true,
		python = false,
		rust = false,
	},
}

-- You can also override the default icons.
vim.g.aerial = {
	icons = {
		Class = "",
		-- The icon to use when a class has been collapsed in the tree
		ClassCollapsed = "喇",
		Function = "",
		Constant = "[c]",
		-- The default icon to use when any symbol is collapsed in the tree
		Collapsed = "▶",
	},
}
