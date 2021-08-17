require("plugins/packer")

local packer = require("packer")

packer.startup({
	{
		"wbthomason/packer.nvim",
		"nvim-lua/plenary.nvim",
		"rktjmp/lush.nvim",
		-- kkDark Colorscheme
		{ "33kk/kkDark" },
		-- Fix for CursorHold(I)
		"antoinemadec/FixCursorHold.nvim",
		-- Icons
		"kyazdani42/nvim-web-devicons",
		"mortepau/codicons.nvim", -- Codicons font
		-- Git
		{ "lewis6991/gitsigns.nvim", requires = "plenary.nvim" }, -- Git signs + feline.nvim git branch
		"tpope/vim-fugitive",
		"kdheepak/lazygit.nvim", -- Lazygit git TUI integration
		-- Satusline
		"famiu/feline.nvim",
		-- TreeSitter
		"nvim-treesitter/nvim-treesitter",
		"JoosepAlviste/nvim-ts-context-commentstring", -- Sets commentstring dynamically for files with multiple languages embedded
		-- Commenting
		"b3nj5m1n/kommentary",
		-- Todo comments
		"folke/todo-comments.nvim",
		-- Detect indent
		"zsugabubus/crazy8.nvim",
		-- Load .editorconfig
		"editorconfig/editorconfig-vim",
		-- Table mode
		"https://github.com/dhruvasagar/vim-table-mode",
		-- Lsp
		"neovim/nvim-lspconfig",
		"glepnir/lspsaga.nvim", -- Popups
		"nvim-lua/lsp_extensions.nvim", -- Extensions for rust, dart, etc...
		"hrsh7th/nvim-compe", -- Completion
		"onsails/lspkind-nvim", -- Completion icons
		"nvim-lua/lsp-status.nvim", -- Lsp utils
		"folke/trouble.nvim", -- Diagnostics list
		"simrat39/symbols-outline.nvim", -- Symbols outline
		-- Linting
		"mfussenegger/nvim-lint",
		-- Formatting
		"mhartington/formatter.nvim",
		-- Snippets
		"hrsh7th/vim-vsnip",
		"hrsh7th/vim-vsnip-integ",
		-- Fuzzy finder
		"junegunn/fzf",
		"junegunn/fzf.vim",
		-- Color highlighting
		"norcalli/nvim-colorizer.lua",
		-- Collaborative editing
		"jbyuki/instant.nvim",
		-- Debugging
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
		-- Welcome screen
		"mhinz/vim-startify",
		-- Indent lines
		"lukas-reineke/indent-blankline.nvim",
		-- Increment/decrement numbers/dates
		"monaqa/dial.nvim",
		-- Auto close pairs
		"windwp/nvim-autopairs",
		-- REST client
		"NTBBloodbath/rest.nvim",
		-- Github integration
		-- 'pwntester/octo.nvim',
		-- Show code context
		"romgrk/nvim-treesitter-context",
		-- Better quickfix list
		"kevinhwang91/nvim-bqf",
		-- Search panel
		"windwp/nvim-spectre",
		-- Highlight ranges
		"winston0410/cmd-parser.nvim",
		"winston0410/range-highlight.nvim",
		-- Preview registers
		"tversteeg/registers.nvim",
		-- Zoxide integration
		"nanotee/zoxide.vim",
		-- Save with sudo
		"lambdalisue/suda.vim",
		-- Org mode alternative
		"vhyrro/neorg",
		-- Spellchecking
		-- 'lewis6991/spellsitter.nvim',
		-- Jump between related files
		"micmine/jumpwire.nvim",
		-- Startuptime viewer
		"dstein64/vim-startuptime",
		-- Set working directory to project root
		-- 'oberblastmeister/rooter.nvim',
		-- File tree
		{
			"ms-jpq/chadtree",
			run = ":CHADdeps",
		},
		-- Database
		"tpope/vim-dadbod",
		"kristijanhusak/vim-dadbod-ui",
		-- Neovim browser integration
		{
			"glacambre/firenvim",
			run = ":call firenvim#install(0)",
		},
		-- Tabline
		-- 'romgrk/barbar.nvim',
	},
})

function load()
	require("plugins/colorscheme")
	require("plugins/tree-sitter")
	require("plugins/trouble")
	require("plugins/todo-comments")
	require("plugins/kommentary")
	require("plugins/lsp")
	require("plugins/formatter")
	require("plugins/lint")
	require("plugins/gitsigns")
	require("plugins/colorizer")
	require("plugins/rest")
	require("plugins/range-highlight")
	require("plugins/indent-blankline")
	require("plugins/symbols-outline")
	require("plugins/dial")
	require("plugins/dap")
	require("plugins/chadtree")
	require("plugins/startify")
	require("plugins/feline")
	--require("plugins/jumpwire")
end

if first_run == true then
	exec("PackerInstall")
else
	load()
end
