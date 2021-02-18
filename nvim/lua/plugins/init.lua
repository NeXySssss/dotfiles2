--[[
     Load Paq
]]
vim.cmd 'packadd paq-nvim'
local paq = require'paq-nvim'.paq
paq{'savq/paq-nvim', opt=true}

--[[
     Plugins
]]
paq'nvim-treesitter/nvim-treesitter'
paq'kyazdani42/nvim-tree.lua'
paq'tjdevries/colorbuddy.vim'
paq'Th3Whit3Wolf/onebuddy'
paq'bluz71/vim-moonfly-colors'
paq'christianchiarulli/nvcode-color-schemes.vim'
paq'neovim/nvim-lspconfig'
paq'glepnir/lspsaga.nvim'
paq'onsails/lspkind-nvim'
paq'hrsh7th/nvim-compe'
paq'hrsh7th/vim-vsnip'
paq'hrsh7th/vim-vsnip-integ'
paq'norcalli/nvim-colorizer.lua'
paq'tpope/vim-fugitive'
paq'TimUntersberger/neogit'
paq'windwp/nvim-autopairs'
paq'monaqa/dial.nvim'
paq'jbyuki/instant.nvim'
paq'b3nj5m1n/kommentary'
paq'glepnir/galaxyline.nvim'

--[[
     Plugin configs
]]
--require'plugins/colorbuddy'
require'plugins/lualine'
require'plugins/colorizer'
require'plugins/treesitter'
require'plugins/lsp'
require'plugins/lspkind'
require'plugins/compe'
require'plugins/lspsaga'
require'plugins/tree'
require'plugins/dial'
require'plugins/autopairs'
require'plugins/galaxyline'
require'plugins/neogit'
