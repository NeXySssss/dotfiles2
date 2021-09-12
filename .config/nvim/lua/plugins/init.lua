require("plugins/packer-init")

local u = require("utils")
local packer = require("packer")

packer.startup({
	{
		"lewis6991/impatient.nvim", -- Speed up startup

		"wbthomason/packer.nvim",
		"nvim-lua/plenary.nvim",
		"rktjmp/lush.nvim",

		-- kkDark Colorscheme
		{ "33kk/kkDark", requires = "lush.nvim" },
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
		-- Close buffers
		"kazhala/close-buffers.nvim",
		-- TreeSitter
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-textobjects",
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
		-- "https://github.com/dhruvasagar/vim-table-mode",
		-- Lsp
		"neovim/nvim-lspconfig",
		"kabouzeid/nvim-lspinstall", -- Language server installer
		"glepnir/lspsaga.nvim", -- Popups
		{ "RishabhRD/nvim-lsputils", requires = { "RishabhRD/popfix" } },
		"nvim-lua/lsp_extensions.nvim", -- Extensions for rust, dart, etc...
		{
			"hrsh7th/nvim-cmp",
			requires = { "hrsh7th/cmp-calc", "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-vsnip", "hrsh7th/cmp-buffer" },
		}, -- Completion
		"nvim-lua/lsp-status.nvim", -- Lsp utils
		"folke/trouble.nvim", -- Diagnostics list
		"stevearc/aerial.nvim", -- Symbols outline
		-- Diagnostics, formatting
		"jose-elias-alvarez/null-ls.nvim",
		-- Snippets
		"hrsh7th/vim-vsnip",
		"hrsh7th/vim-vsnip-integ",
		-- Per project config
		"windwp/nvim-projectconfig",
		-- Fuzzy finder
		"nvim-telescope/telescope.nvim",
		-- Color highlighting
		"norcalli/nvim-colorizer.lua",
		-- Collaborative editing
		"jbyuki/instant.nvim",
		-- Debugging
		"mfussenegger/nvim-dap",
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
		"Pocco81/DAPInstall.nvim",
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
		-- Rainbow parentheses
		"p00f/nvim-ts-rainbow",
		-- Better quickfix list
		"kevinhwang91/nvim-bqf",
		-- Search panel
		"dyng/ctrlsf.vim",
		-- Highlight ranges
		"winston0410/cmd-parser.nvim",
		"winston0410/range-highlight.nvim",
		"nacro90/numb.nvim",
		-- Preview registers
		"tversteeg/registers.nvim",
		-- Zoxide integration
		"nanotee/zoxide.vim",
		-- Save with sudo
		"lambdalisue/suda.vim",
		-- Org mode alternative
		-- TODO: Configure this
		"nvim-neorg/neorg",
		-- Spellchecking
		-- 'lewis6991/spellsitter.nvim',
		-- Auto cd to project root
		"ahmedkhalf/project.nvim",
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
	},
})

if _G.first_run == true then
	u.exec("PackerInstall")
else
	require("plugins/config")
	require("plugins/mappings")
end
