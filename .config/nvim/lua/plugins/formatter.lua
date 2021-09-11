local function prettier()
	return {
		exe = "prettier",
		args = {
			"--stdin-filepath",
			vim.api.nvim_buf_get_name(0),
			"--single-quote",
		},
		stdin = true,
	}
end

local function eslint_d()
	return {
		exe = "eslint_d",
		args = {
			"--stdin",
			"--stdin-filename",
			vim.api.nvim_buf_get_name(0),
			"--fix-to-stdout",
		},
		stdin = true,
	}
end

require("formatter").setup({
	logging = false,
	filetype = {
		javascript = {
			eslint_d,
		},
		typescript = {
			eslint_d,
		},
		svelte = {
			eslint_d,
		},
		vue = {
			eslint_d,
		},
		json = {
			prettier,
		},
		rust = {
			function()
				return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
			end,
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0), "-" },
					stdin = true,
				}
			end,
		},
	},
})
