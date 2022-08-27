function _G.pp(...)
	local t = {}
	for _, value in ipairs { ... } do
		table.insert(t, vim.inspect(value))
	end
	print(unpack(t))
	return ...
end

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	_G.packer_bootstrap = vim.fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	vim.cmd("packadd packer.nvim")
end
