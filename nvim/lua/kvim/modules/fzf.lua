local function plugins(use)
	use { "ibhagwan/fzf-lua", requires = { "kyazdani42/nvim-web-devicons" } }
end

local function load(modules)
	require("fzf-lua").setup {
		winopts = {
			preview = {
				-- delay = 100,
				scrollbar = false,
			},
		},
		previewers = {
			builtin = {
				limit_b = 1024 * 1024,
			},
		},
	}

	modules.utils.set_maps({
		{ "n", "<leader>ff", "<cmd>FzfLua files<CR>", { desc = "Files" } },
		{ "n", "<leader>fm", "<cmd>FzfLua marks<CR>", { desc = "Marks" } },
		{ "n", "<leader>fd", "<cmd>FzfLua diagnostics_workspace<CR>", { desc = "Diagnostics" } },
		{ "n", "<leader>fs", "<cmd>FzfLua lsp_workspace_symbols<CR>", { desc = "Diagnostics" } },
	}, {
		desc = "FZF",
	})

	modules.utils.set_map_group("<leader>f", "FZF")
end

return {
	depends = { "utils" },
	-- conflicts = { "telescope" },
	plugins = plugins,

	load = load,
	load_after = { "utils" },
}
