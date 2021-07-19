local ci = require("codicons")

require("lspkind").init({
	with_text = true,
	symbol_map = {
		Text = ci.get("symbol-text") .. " ",
		Method = ci.get("symbol-method") .. " ",
		Function = ci.get("symbol-function") .. " ",
		Constructor = ci.get("symbol-constructor") .. " ",
		Field = ci.get("symbol-field") .. " ",
		Variable = ci.get("symbol-variable") .. " ",
		Class = ci.get("symbol-class") .. " ",
		Interface = ci.get("symbol-interface") .. " ",
		Module = ci.get("symbol-module") .. " ",
		Property = ci.get("symbol-property") .. " ",
		Unit = ci.get("symbol-unit") .. " ",
		Value = ci.get("symbol-value") .. " ",
		Enum = ci.get("symbol-enum") .. " ",
		Keyword = ci.get("symbol-keyword") .. " ",
		Snippet = ci.get("symbol-snippet") .. " ",
		Color = ci.get("symbol-color") .. " ",
		File = ci.get("symbol-file") .. " ",
		Reference = ci.get("symbol-reference") .. " ",
		Folder = ci.get("symbol-folder") .. " ",
		EnumMember = ci.get("symbol-enum-member") .. " ",
		Constant = ci.get("symbol-constant") .. " ",
		Struct = ci.get("symbol-struct") .. " ",
		Event = ci.get("symbol-event") .. " ",
		Operator = ci.get("symbol-operator") .. " ",
		TypeParameter = ci.get("symbol-type-parameter") .. " ",
	},
})

exec([[
sign define LspDiagnosticsSignError text=]] .. ci.get("error") .. [[ texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=]] .. ci.get("warning") .. [[ texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=]] .. ci.get("info") .. [[ texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=]] .. ci.get("info") .. [[ texthl=LspDiagnosticsSignHint linehl= numhl=
]])
