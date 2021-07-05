--[[ -- use the same configuration you would use for `vim.lsp.diagnostic.on_publish_diagnostics`.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	require("lsp_extensions.workspace.diagnostic").handler,
	{ signs = { severity_limit = "Error" } }
) ]]

exec([[
autocmd CursorHold,CursorHoldI *.rs :lua require'lsp_extensions'.inlay_hints{ only_current_line = true }
]])
