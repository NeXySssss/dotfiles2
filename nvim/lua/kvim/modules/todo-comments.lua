local function plugins(use)
	use { "folke/todo-comments.nvim", requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" } }
end

local function load(modules, defs)
	require("todo-comments").setup()

	if defs.trouble then
		modules.utils.set_maps({
			{ "n", "<leader>xt", "<cmd>TroubleToggle todo<CR>", { desc = "TODO" } },
		}, { desc = "Trouble" })
	end
end

return {
	depends = { "utils" },
	plugins = plugins,

	load = load,
	load_after = { "trouble" },
}
