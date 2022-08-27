local function plugins(use)
	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"kyazdani42/nvim-web-devicons",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	}
	use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
	use { "nvim-telescope/telescope-ui-select.nvim" }
end

local function load(modules)
	modules.utils.set_maps({
		{ "n", "<leader>ff", "<cmd>Telescope fd<CR>", { desc = "Files" } },
		{ "n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Marks" } },
		{ "n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" } },
		-- { "n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "TelescopeDiagnostics" } },
	}, {
		desc = "Telescope",
	})
end

return {
	depends = { "utils" },
	plugins = plugins,

	load = load,
	load_after = { "utils" },
}
