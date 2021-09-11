local severities = {
	[0] = vim.lsp.protocol.DiagnosticSeverity.Information,
	[1] = vim.lsp.protocol.DiagnosticSeverity.Warning,
	[2] = vim.lsp.protocol.DiagnosticSeverity.Error,
}

return {
	cmd = "eslint_d",
	stdin = true,
	args = {
		"--format=json",
		"--stdin",
		"--stdin-filename",
		function()
			return vim.api.nvim_buf_get_name(0)
		end,
	},
	ignore_exitcode = true,
	parser = function(output, bufnr)
		local diagnostics = {}
		local bufname = vim.api.nvim_buf_get_name(bufnr)

		local firstch = string.sub(output, 1, 1)
		if firstch ~= "[" and firstch ~= "{" then
			return diagnostics
		end

		local decoded = vim.fn.json_decode(output)

		for _, item in ipairs(decoded or {}) do
			if item.filePath == bufname then
				for _, diag in ipairs(item.messages or {}) do
					table.insert(diagnostics, {
						range = {
							["start"] = {
								line = diag.line - 1,
								character = diag.column - 1,
							},
							["end"] = {
								line = diag.engLine and diag.endLine - 1 or diag.line - 1,
								character = diag.endColumn and diag.endColumn - 1 or diag.column - 1,
							},
						},
						code = diag.ruleId,
						severity = severities[diag.severity],
						message = diag.message,
					})
				end
			end
		end
		return diagnostics
	end,
}
