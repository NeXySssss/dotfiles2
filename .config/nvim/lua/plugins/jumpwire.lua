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

map("n", "<cmd>lua require('jumpwire').jump('toggle')<CR>", { noremap = true, silent = true })
map("n", "<cmd>lua require('jumpwire').jump('implementation')<CR>", { noremap = true, silent = true })
