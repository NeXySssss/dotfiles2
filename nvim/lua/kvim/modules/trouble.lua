local function plugins(use)
	use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
end

local function load(modules)
	require("trouble").setup()

	modules.utils.set_maps({
		{
			"n",
			"<leader>xx",
			"<cmd>TroubleToggle workspace_diagnostics<CR>",
			{ desc = "Workspace Diagnostics" },
		},
		{ "n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", { desc = "Quickfix" } },
	}, {
		desc = "Trouble",
	})

	modules.utils.set_map_group("<leader>x", "Trouble")
end

return {
	depends = { "utils" },
	plugins = plugins,

	load = load,
}
