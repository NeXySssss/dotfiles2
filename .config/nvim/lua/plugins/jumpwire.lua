local u = require("utils")

-- TODO: Fork plugin to support opening first file that exists (cpp/c <-> hpp/h)
require("jumpwire").setup({
	language = {
		["cpp"] = {
			toggle = { type = "fileExtension", data = "h" },
		},
		["h"] = {
			toggle = { type = "fileExtension", data = "cpp" },
		},
	},
})

u.map("n", "<cmd>lua require('jumpwire').jump('toggle')<CR>")
u.map("n", "<cmd>lua require('jumpwire').jump('implementation')<CR>")
