local lsp_status = require("lsp-status")
local lsp_installer = require("nvim-lsp-installer")
local lspconfig = require("lspconfig")

local defaults = require("plugins/config/lsp/config").defaults

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local configs = {}

-- Lua
configs["sumneko_lua"] = defaults{
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
}

-- Json
configs["jsonls"] = defaults{
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
					fileMatch = { ".prettierrc*" },
					url = "http://json.schemastore.org/prettierrc",
				},
				{
					fileMatch = { "*.schema.json" },
					url = "http://json-schema.org/draft-07/schema#",
				},
			},
		},
	},
}

-- Yaml
configs["yamlls"] = defaults{
	settings = {
		yaml = {
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
		},
	},
}

-- Cpp
configs["clangd"] = defaults{
	handlers = lsp_status.extensions.clangd.setup(),
}


lsp_installer.on_server_ready(function(server)
	server:setup(configs[server.name] or defaults{})
end)
