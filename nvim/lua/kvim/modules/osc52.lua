local function plugins(use)
	use { "ojroques/nvim-osc52" }
end

local function load(modules)
	local osc52 = require("osc52")

	osc52.setup {
		silent = true,
		trim = false,
	}

	local function copy(lines, _)
		require("osc52").copy(table.concat(lines, "\n"))
	end

	local function paste()
		return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
	end

	vim.g.clipboard = {
		name = "osc52",
		copy = { ["+"] = copy, ["*"] = copy },
		paste = { ["+"] = paste, ["*"] = paste },
	}
end

return {
	plugins = plugins,

	load = load,
}
