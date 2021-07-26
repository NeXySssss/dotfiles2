require("lint").linters.eslint_d = require("plugins/lint/eslint_d")

require("lint").linters_by_ft = {
	bash = { "shellcheck" },
	sh = { "shellcheck" },
	zsh = { "shellcheck" },
	js = { "eslint_d" },
}
exec([[
	au BufEnter,TextChanged,InsertLeave <buffer> lua require('lint').try_lint()
]])
