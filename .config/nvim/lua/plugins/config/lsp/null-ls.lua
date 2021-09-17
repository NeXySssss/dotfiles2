local u = require("utils")
local uv = vim.loop
local lsputil = require("lspconfig.util")
local nls = require("null-ls")

local fmt = nls.builtins.formatting
local lint = nls.builtins.diagnostics

-- Utils
local function root_has_file(name)
	return u.dir_has_file(uv.cwd(), name)
end

local function root_has_matching_file(pattern)
	return u.dir_has_matching_file(uv.cwd(), pattern)
end

-- Detect eslint and eslint-plugin-prettier
local function prettier_eslint_check()
	local has_eslint = false
	local cwd = uv.cwd()

	if root_has_matching_file("%.eslintrc%..*") then
		has_eslint = true
	elseif root_has_file("package.json") then
		local json = u.read_json(lsputil.path.join(cwd, "package.json"))
		if json.eslintConfig ~= nil then
			has_eslint = true
		end
	end

	if has_eslint then
		local has_prettier_plugin = root_has_file("node_modules/eslint-plugin-prettier/package.json")

		if has_prettier_plugin then
			return "eslint"
		else
			return "prettier_eslint"
		end
	else
		return "prettier"
	end
end

-- Register eslint/prettier sources conditionally
function _G.null_ls_prettier_eslint()
	local result = prettier_eslint_check()

	if result == "eslint" then
		nls.register(fmt.eslint_d.with({
			filetypes = fmt.prettier.filetypes,
		}))
		nls.register(lint.eslint_d.with({
			filetypes = fmt.prettier.filetypes,
		}))
	elseif result == "prettier_eslint" then
		nls.register(fmt.prettier)
		nls.register(fmt.eslint_d)
		nls.register(lint.eslint_d)
	else
		nls.register(fmt.prettier)
	end
end

u.exec(
	"autocmd FileType javascript,javascriptreact,typescript,typescriptreact,vue,svelte,css,scss,html,json,yaml,markdown lua null_ls_prettier_eslint()"
)

-- Configure sources
nls.config({
	sources = {
		fmt.stylua,

		fmt.shellcheck,
		lint.shellcheck,

		fmt.clang_format,
		fmt.gofmt,
		fmt.rustfmt,

		fmt.nixfmt,
		fmt.shfmt,

		fmt.cmake_format,
		fmt.nginx_beautifier,
	},
})
