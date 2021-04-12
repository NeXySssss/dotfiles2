local nvim_lsp = require('lspconfig')
local lsp_status = require('lsp-status')
lsp_status.register_progress()

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = {noremap = true, silent = true}
	--[[ buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts) ]]
	buf_set_keymap('n', '<leader>wa',
               	'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<leader>wr',
               	'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<leader>wl',
               	'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
               	opts)
	--[[ buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
               	opts) ]]
	buf_set_keymap('n', '<leader>q',
               	'<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

	-- Set some keybinds conditional on server capabilities
	if client.resolved_capabilities.document_formatting then
		buf_set_keymap("n", "<leader>f",
               		"<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>", opts)
	elseif client.resolved_capabilities.document_range_formatting then
		buf_set_keymap("n", "<leader>f",
               		"<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	end

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		exec [[
		hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
		hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
		hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
		augroup lsp_document_highlight
		autocmd! * <buffer>
		autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
		autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
		augroup END
		]]
	end

	lsp_status.on_attach(client)
end

exec [[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', highlight = "NonText", enabled = {"ChainingHint", "TypeHint", "ParameterHint"} }]]

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = vim.tbl_extend('keep', capabilities or {},
                              lsp_status.capabilities)

--[[ nvim_lsp.sumneko_lua.setup {
	cmd = {"lua-language-server"},
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
				-- Setup your lua path
				path = vim.split(package.path, ';')
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'}
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand('$VIMRUNTIME/lua')] = true,
					[vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
				}
			}
		}
	},

	-- Runtime configurations
	filetypes = {"lua"},
	capabilities = capabilities,
	on_attach = on_attach
} ]]

nvim_lsp.tsserver.setup {
	filetypes = {
		"javascript", "javascriptreact", "javascript.jsx", "typescript",
  "typescriptreact", "typescript.tsx"
	},
	root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json",
                                      	"jsconfig.json", ".git", "/"),
	capabilities = capabilities,
	on_attach = on_attach
}

nvim_lsp.html.setup {capabilities = capabilities, on_attach = on_attach}

nvim_lsp.cssls.setup {capabilities = capabilities, on_attach = on_attach}

nvim_lsp.jsonls.setup {
	commands = {
		Format = {
			function() vim.lsp.buf.range_formatting({}, {0, 0}, {vim.fn.line("$"), 0}) end
		}
	},
	capabilities = capabilities,
	on_attach = on_attach
}

local pid = vim.fn.getpid()
nvim_lsp.omnisharp.setup {
	cmd = {vim.loop.os_homedir() .. "/Documents/omnisharp/run", "--languageserver", "--hostPID", tostring(pid)},
	capabilities = capabilities,
	on_attach = on_attach
}

nvim_lsp.rust_analyzer.setup {
	capabilities = capabilities,
	on_attach = on_attach
}

local eslint = {
	lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
	lintStdin = true,
	lintFormats = {"%f:%l:%c: %m"},
	lintIgnoreExitCode = true,
	formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
	formatStdin = true
}
local shellcheck = {
	lintCommand = "shellcheck -f gcc -x -",
	lintStdin = true,
	lintFormats = {
		"%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m"
	}
}
local shfmt = {formatCommand = "shfmt -ci -s -bn", formatStdin = true}
local lua = {
	formatCommand = "lua-format --use-tab --indent-width 1 --tab-width 1 -i",
	formatStdin = true
}
local function prettier(parser)
	return {
		formatCommand = "prettier --use-tabs --print-width 9999 --stdin-filename=pepega." ..
						parser .. " --parser " .. parser,
		formatStdin = true
	}
end

nvim_lsp.efm.setup {
	init_options = {documentFormatting = true},
	settings = {
		rootMarkers = {".git", "package.json", "tsconfig.json", "jsconfig.json", "*"},
		languages = {
			javascript = {eslint},
			javascriptreact = {eslint},
			["javascript.jsx"] = {eslint},
			typescript = {eslint},
			["typescript.tsx"] = {eslint},
			typescriptreact = {eslint},
			lua = {lua},
			sh = {shellcheck, shfmt},
			bash = {shellcheck, shfmt},
			zsh = {shellcheck, shfmt},
			json = {prettier("json")}
		}
	},
	filetypes = {
		"javascript", "javascriptreact", "javascript.jsx", "typescript",
  "typescriptreact", "typescript.tsx", "lua", "sh", "bash", "zsh", "json"
	},
	root_dir = nvim_lsp.util.root_pattern {
		".git", "package.json", "tsconfig.json", "jsconfig.json", "/"
	},
	capabilities = capabilities,
	on_attach = on_attach
}

nvim_lsp.clangd.setup {
	capabilities = capabilities,
	on_attach = on_attach
}
