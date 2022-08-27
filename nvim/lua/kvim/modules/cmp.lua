local function has_words_before()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function feedkey(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local codicons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

local function plugins(use)
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-calc",
			"f3fora/cmp-spell",
		},
	}
end

local function preload(modules, defs)
	modules.cmp = {
		sources = {
			{ name = "buffer", label = "Buffer" },
			{ name = "spell", label = "Spell" },
			{ name = "nvim_lua", label = "Nvim" },
			{ name = "calc", label = "Calc" },
			{ name = "path", label = "Path" },
		},
	}
end

local function postload(modules, defs)
	local cmp = require("cmp")
	local luasnip = require("luasnip")

	local sources_keyed = {}

	for _, v in ipairs(modules.cmp.sources) do
		sources_keyed[v.name] = v
	end

	cmp.setup {
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		window = {
			completion = cmp.config.window.bordered {
				border = "single",
			},
			documentation = cmp.config.window.bordered {
				border = "single",
			},
		},
		mapping = cmp.mapping.preset.insert {
			["<Esc>"] = cmp.mapping.close(),
			["<C-b>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.abort(),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				-- elseif luasnip.expand_or_jumpable() then
				-- 	feedkey("<Plug>luasnip-expand-or-jump", "")
				elseif has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp and cmp.visible() then
					cmp.select_prev_item()
				-- elseif luasnip.jumpable(-1) then
				-- 	feedkey("<Plug>luasnip-jump-prev", "")
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<CR>"] = cmp.mapping.confirm {
				select = false,
			}, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		},
		formatting = {
			format = function(entry, vim_item)
				local max_width = 30
				if max_width ~= 0 and #vim_item.abbr > max_width then
					vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. "…"
				end

				-- Get LSP server name
				local lsp_server
				if entry.source and entry.source.source and entry.source.source.client then
					lsp_server = entry.source.source.client.name:gsub("_lsp?$", ""):gsub("_language_server$", "")
				end

				local source = sources_keyed[entry.source.name]
				vim_item.kind = source.kind or codicons[vim_item.kind]
				vim_item.menu = "[" .. (lsp_server or source.label) .. "]"
				return vim_item
			end,
		},
		sources = cmp.config.sources(modules.cmp.sources),

		sorting = {
			comparators = {
				cmp.config.compare.exact,
				cmp.config.compare.sort_text,
				cmp.config.compare.offset,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.kind,
				cmp.config.compare.order,
				cmp.config.compare.length,
			},
		},
	}

	-- Set configuration for specific filetype.
	-- cmp.setup.filetype("gitcommit", {
	--     sources = cmp.config.sources({{
	--         name = "cmp_git"
	--     } -- You can specify the `cmp_git` source if you were installed it.
	--     }, {
	--         { name = "buffer" }
	--     })
	-- })

	-- Use buffer source for `/` (if you enabled `native_menu`, this won"t work anymore).
	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	-- Use cmdline & path source for ":" (if you enabled `native_menu`, this won"t work anymore).
	-- cmp.setup.cmdline(":", {
	--     mapping = cmp.mapping.preset.cmdline(),
	--     sources = cmp.config.sources({
	--         { name = "path" },
	--         { name = "cmdline" },
	--     })
	-- })
end

return {
	depends = { "luasnip" },
	plugins = plugins,

	preload = preload,
	postload = postload,
}
