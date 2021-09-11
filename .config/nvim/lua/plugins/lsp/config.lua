local u = require("utils")
local lspconfig = require("lspconfig")
local lsp_status = require("lsp-status")
local lspinstall = require("lspinstall")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

lspinstall.setup()
lsp_status.register_progress()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	lsp_status.on_attach(client)
end

local function defaults(config)
	local _defaults = {
		capabilities = capabilities,
		on_attach = on_attach,
		flags = { debounce_text_changes = 150 },
	}
	for k, v in pairs(config) do
		_defaults[k] = v
	end
	return _defaults
end

local srv = lspinstall.installed_servers()

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lspconfig[u.has(srv, "lua") and "lua" or "sumneko_lua"].setup(defaults({
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				path = runtime_path,
			},
			diagnostics = {
				globals = {'vim'},
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
	root_dir = lspconfig.util.root_pattern("nvim", "lua", ".git", ".gitignore")
}))
lspconfig.html.setup(defaults({}))
lspconfig[u.has(srv, "typescript") and "typescript" or "tsserver"].setup(defaults({}))
lspconfig[u.has(srv, "vue") and "vue" or "vuels"].setup(defaults({}))
lspconfig[u.has(srv, "css") and "css" or "cssls"].setup(defaults({}))
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
lspconfig[u.has(srv, "yaml") and "yaml" or "yamlls"].setup(defaults({
	settings = {
		yaml = {
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json"
			}
		}
	}
}))
lspconfig[u.has(srv, "rust") and "rust" or "rust_analyzer"].setup(defaults({
	cmd = { "rustup", "run", "nightly", "rust-analyzer" }
}))
lspconfig[u.has(srv, "cpp") and "cpp" or "clangd"].setup(defaults({
	handlers = lsp_status.extensions.clangd.setup(),
}))

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
