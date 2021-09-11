local u = require("utils")

local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  u.exec("!git clone https://github.com/wbthomason/packer.nvim "..install_path)
  u.exec("packadd packer.nvim")
	first_run = true
end
