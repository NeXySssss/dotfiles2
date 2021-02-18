--[[
     Load Paq
]] success, value = pcall(exec, 'packadd paq-nvim')

if success == false then
	print("Installing paq.nvim")
	if system_name == "Linux" or system_name == "macOS" then
		exec '!git clone https://github.com/savq/paq-nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/opt/paq-nvim'
	elseif system_name == "Windows" then
		exec '!git clone https://github.com/savq/paq-nvim.git "$env:LOCALAPPDATA\\nvim-data\\site\\pack\\paqs\\opt\\paq-nvim"'
	end
	exec 'packadd paq-nvim'
end

local paq = require'paq-nvim'.paq
paq {'savq/paq-nvim', opt = true}

--[[
     Plugins
]]
paq 'kyazdani42/nvim-web-devicons'
paq 'nvim-treesitter/nvim-treesitter'
paq 'kyazdani42/nvim-tree.lua'
paq 'tjdevries/colorbuddy.vim'
paq 'Th3Whit3Wolf/onebuddy'
paq 'bluz71/vim-moonfly-colors'
paq 'christianchiarulli/nvcode-color-schemes.vim'
paq 'neovim/nvim-lspconfig'
paq 'glepnir/lspsaga.nvim'
paq 'onsails/lspkind-nvim'
paq 'nvim-lua/lsp-status.nvim'
paq 'nvim-lua/lsp_extensions.nvim'
paq 'hrsh7th/nvim-compe'
paq 'hrsh7th/vim-vsnip'
paq 'hrsh7th/vim-vsnip-integ'
paq 'norcalli/nvim-colorizer.lua'
paq 'tpope/vim-fugitive'
paq 'TimUntersberger/neogit'
paq 'windwp/nvim-autopairs'
paq 'monaqa/dial.nvim'
paq 'jbyuki/instant.nvim'
paq 'b3nj5m1n/kommentary'
paq 'glepnir/galaxyline.nvim'
paq 'mfussenegger/nvim-dap'
paq 'puremourning/vimspector'
paq 'theHamsta/nvim-dap-virtual-text'
paq 'mhinz/vim-startify'

if success == false then
	exec 'PaqInstall'
else
	--[[
     Plugin configs
]]
	require 'plugins/colorizer'
	require 'plugins/colorscheme'
	require 'plugins/treesitter'
	require 'plugins/lsp'
	require 'plugins/lspkind'
	require 'plugins/compe'
	require 'plugins/lspsaga'
	require 'plugins/tree'
	require 'plugins/dial'
	require 'plugins/autopairs'
	require 'plugins/galaxyline'
	require 'plugins/neogit'
	-- require 'plugins/dap'
	require 'plugins/vimspector'
end

