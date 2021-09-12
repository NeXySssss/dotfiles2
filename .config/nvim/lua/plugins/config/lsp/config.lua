local M = {}

local u = require("utils")
local lsp_status = require("lsp-status")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local mappings = require("plugins/mappings/lsp")

lsp_status.register_progress()

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = { "documentation", "detail", "additionalTextEdits" },
}
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function M.on_attach(client, bufnr)
	client.resolved_capabilities.document_formatting = false

	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	mappings(bufnr)

	u.exec("command! -buffer Format :lua vim.lsp.buf.formatting()")
	u.exec("command! -buffer FormatWrite :lua vim.lsp.buf.formatting_sync(); vim.loop.sleep(500); vim.cmd('w')")

	lsp_status.on_attach(client)
end

function M.defaults(config)
	local _defaults = {
		capabilities = M.capabilities,
		on_attach = M.on_attach,
		flags = { debounce_text_changes = 150 },
	}
	for k, v in pairs(config) do
		_defaults[k] = v
	end
	return _defaults
end

return M
