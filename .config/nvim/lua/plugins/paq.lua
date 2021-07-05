success, value = pcall(exec, "packadd paq-nvim")

if success == false then
	print("Installing paq.nvim")
	if system_name == "Linux" or system_name == "macOS" then
		exec(
			'!git clone https://github.com/savq/paq-nvim.git "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/opt/paq-nvim'
		)
	elseif system_name == "Windows" then
		exec(
			'!git clone https://github.com/savq/paq-nvim.git "$env:LOCALAPPDATA\\nvim-data\\site\\pack\\paqs\\opt\\paq-nvim"'
		)
	end
	exec("packadd paq-nvim")
end
