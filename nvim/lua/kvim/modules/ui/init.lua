local function plugins(use)
	use { "33kk/kkDark" }
	use { "33kk/stl.nvim" }
	use { "SmiteshP/nvim-navic" }
end

local function load(modules, defs)
	-- NOTE: Wait for release: https://github.com/neovim/neovim/commit/559ef3e90393a8f02c8350a9d60f4b7849815d97
	vim.cmd("colorscheme kkDark")

	vim.cmd([[
	aunmenu PopUp.How-to\ disable\ mouse
	aunmenu PopUp.-1-
	]])

	require("kvim.modules.ui.signs")
	require("kvim.modules.ui.statusline")
end

return {
	plugins = plugins,

	load = load,
	load_after = { "lsp", "treesitter" },
}
