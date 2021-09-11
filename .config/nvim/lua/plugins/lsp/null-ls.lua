local u = require("utils")
local uv = vim.loop
local lsputil = require("lspconfig.util")

local nls = require("null-ls")

local fmt = nls.builtins.formatting
local lint = nls.builtins.diagnostics

local function root_has_file(name)
	return lsputil.path.exists(lsputil.path.join(uv.cwd(), name))
end

local function eslint_check()
	local has_eslint = false
	local cwd = uv.cwd()

	if vim.fn.glob(lsputil.path.join(cwd, ".eslintrc.*")) ~= "" then
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
			return "eslint_prettier"
		else
			return "eslint"
		end
	else
		return "prettier"
	end
end

local prettier_filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"vue",
	"svelte",
	"css",
	"scss",
	"html",
	"json",
	"yaml",
	"markdown",
}

local eslint_filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" }

function _G.null_ls_eslint_prettier()
	local result = eslint_check()

	if result == "eslint_prettier" then
		nls.register(fmt.eslint_d.with({
			filetypes = prettier_filetypes,
		}))
		nls.register(lint.eslint_d.with({
			filetypes = prettier_filetypes,
		}))
	elseif result == "eslint" then
		nls.register(fmt.eslint_d.with({
			filetypes = eslint_filetypes,
		}))
		nls.register(lint.eslint_d.with({
			filetypes = eslint_filetypes,
		}))
		nls.register(fmt.prettier.with({
			filetypes = { "css", "scss", "html", "json", "yaml", "markdown" },
		}))
	else
		nls.register(fmt.prettier)
	end
end

nls.config({
	sources = {
		fmt.stylua.with({
			condition = function(utils)
				return utils.root_has_file("stylua.toml") or utils.root_has_file(".stylua.toml")
			end,
		}),

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

u.exec(
	"autocmd FileType javascript,javascriptreact,typescript,typescriptreact,vue,svelte,css,scss,html,json,yaml,markdown lua null_ls_eslint_prettier()"
)
