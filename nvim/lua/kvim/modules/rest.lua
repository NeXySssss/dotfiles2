local function plugins(use)
	use {
		"NTBBloodbath/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	}
end

local function load(modules, defs)
	if defs.treesitter then
		table.insert(modules.treesitter.parsers, "http")
	end

	require("rest-nvim").setup {
		-- Open request results in a horizontal split
		result_split_horizontal = false,
		-- Keep the http file buffer above|left when split horizontal|vertical
		result_split_in_place = false,
		-- Skip SSL verification, useful for unknown certificates
		skip_ssl_verification = false,
		-- Highlight request on run
		highlight = {
			enabled = true,
			timeout = 150,
		},
		result = {
			-- toggle showing URL, HTTP info, headers at top the of result window
			show_url = true,
			show_http_info = true,
			show_headers = true,
		},
		-- Jump to request line on run
		jump_to_request = false,
		env_file = ".env",
		custom_dynamic_variables = {},
		yank_dry_run = true,
	}

	vim.api.nvim_create_autocmd({ "BufReadPost" }, {
		pattern = { "*.http" },
		callback = function(t)
			modules.utils.set_map("n", "<CR>", "<Plug>RestNvim", { buffer = t.buf })
		end,
	})
end

return {
	depends = { "utils" },
	plugins = plugins,

	load = load,
	load_after = { "utils", "treesitter" },
}
