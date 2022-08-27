local function load(modules, defs)
	if defs.lsp then
		modules.lsp.configs.emmet_ls = {
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
		}
	end
end

return {
	load = load,
	load_after = { "lsp" },
}
