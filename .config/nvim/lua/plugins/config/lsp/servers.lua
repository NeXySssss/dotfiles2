local u = require("utils")

local lsp_status = require("lsp-status")
local lspinstall = require("lspinstall")
local lspconfig = require("lspconfig")

local defaults = require("plugins/config/lsp/config").defaults
local srv = lspinstall.installed_servers()

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspinstall.setup()

-- Null-ls
lspconfig["null-ls"].setup(defaults({}))

-- Lua
lspconfig[u.has(srv, "lua") and "lua" or "sumneko_lua"].setup(defaults({
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = runtime_path,
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
	root_dir = lspconfig.util.root_pattern("nvim", "lua", ".git", ".gitignore"),
}))

-- Html
lspconfig.html.setup(defaults({}))

-- TypeScript
lspconfig[u.has(srv, "typescript") and "typescript" or "tsserver"].setup(defaults({}))

-- Vue
lspconfig[u.has(srv, "vue") and "vue" or "vuels"].setup(defaults({}))

-- Css
lspconfig[u.has(srv, "css") and "css" or "cssls"].setup(defaults({}))

-- Json
lspconfig[u.has(srv, "json") and "json" or "jsonls"].setup(defaults({
	settings = {
		json = {
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig*.json" },
					url = "https://json.schemastore.org/tsconfig.json",
				},
				{
					fileMatch = { ".eslintrc.json" },
					url = "https://json.schemastore.org/eslintrc.json",
				},
				{
					fileMatch = { "*.schema.json" },
					url = "http://json-schema.org/draft-07/schema#",
				},
			},
		},
	},
}))

-- Yaml
lspconfig[u.has(srv, "yaml") and "yaml" or "yamlls"].setup(defaults({
	settings = {
		yaml = {
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
		},
	},
}))

-- Rust
lspconfig[u.has(srv, "rust") and "rust" or "rust_analyzer"].setup(defaults({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" },
}))

-- Cpp
lspconfig[u.has(srv, "cpp") and "cpp" or "clangd"].setup(defaults({
	handlers = lsp_status.extensions.clangd.setup(),
}))

-- Csharp
if u.has(srv, "csharp") then
	lspconfig.csharp.setup(defaults({}))
else
	lspconfig.omnisharp.setup(defaults({
		cmd = {
			vim.loop.os_homedir() .. "/Documents/omnisharp/run",
			"--languageserver",
			"--hostPID",
			tostring(vim.fn.getpid()),
		},
	}))
end

-- Svelte
if u.has(srv, "svelte") then
	lspconfig.svelte.setup(defaults({}))
else
	lspconfig.svelte.setup(defaults({
		cmd = {
			"node",
			vim.loop.os_homedir() .. "/Documents/svelte-language-tools/packages/language-server/bin/server.js",
			"--experimental-modules",
			"--stdio",
		},
	}))
end
