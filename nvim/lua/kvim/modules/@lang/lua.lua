local function load(modules, defs)
	local runtime_path = vim.split(package.path, ";")
	table.insert(runtime_path, "lua/?.lua")
	table.insert(runtime_path, "lua/?/init.lua")

	if defs.treesitter then
		table.insert(modules.treesitter.parsers, "lua")
	end

	if defs.nls then
		table.insert(modules.nls.sources, require("null-ls").builtins.formatting.stylua)
	end

	-- TODO: change back to false
	if true and defs.lsp then
		modules.lsp.configs["sumneko_lua"] = {
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
			root_dir = require("lspconfig").util.root_pattern("nvim", "lua", ".git", ".gitignore"),
		}
	end
end

return {
	load = load,
	load_after = { "lsp", "treesitter", "null-ls" },
}
