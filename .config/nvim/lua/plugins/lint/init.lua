require("lint").linters.eslint_d = require("plugins/lint/eslint_d")

require("lint").linters_by_ft = {
	bash = { "shellcheck" },
	sh = { "shellcheck" },
	zsh = { "shellcheck" },
	javascript = { "eslint_d" },
	typescript = { "eslint_d" },
	svelte = { "eslint_d" },
	vue = { "eslint_d" },
}

exec[[
	au BufEnter,TextChanged,InsertLeave * lua require('lint').try_lint()
]]
