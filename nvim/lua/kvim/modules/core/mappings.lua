return function(modules)
	local utils = modules.utils

	vim.g.mapleader = " "

	utils.set_langmap {
		q = "й",
		w = "ц",
		e = "у",
		r = "к",
		t = "е",
		y = "н",
		u = "г",
		i = "ш",
		o = "щ",
		p = "з",
		["["] = "х",
		["]"] = { "ъ", "ї" },
		a = "ф",
		s = { "ы", "і" },
		d = "в",
		f = "а",
		g = "п",
		h = "р",
		j = "о",
		k = "л",
		l = "д",
		[";"] = "ж",
		["'"] = "э",
		z = "я",
		x = "ч",
		c = "с",
		v = "м",
		b = "и",
		n = "т",
		m = "ь",
		[","] = "б",
		["/"] = "ю",
		Q = "Й",
		W = "Ц",
		E = "У",
		R = "К",
		T = "Е",
		Y = "Н",
		U = "Г",
		I = "Ш",
		O = "Щ",
		P = "З",
		["{"] = "Х",
		["}"] = { "Ъ", "Ї" },
		A = "Ф",
		S = { "Ы", "І" },
		D = "В",
		F = "А",
		G = "П",
		H = "Р",
		J = "О",
		K = "Л",
		L = "Д",
		[":"] = "Ж",
		["\""] = "Э",
		Z = "Я",
		X = "Ч",
		C = "С",
		V = "М",
		B = "И",
		N = "Т",
		M = "Ь",
		["<"] = "Б",
		[">"] = "Ю",
	}

	utils.set_maps({
		-- Split navigation
		{ "", { "<A-h>", "<A-Left>" }, "<cmd>wincmd h<CR>", { desc = "Go to the left window" } },
		{ "", { "<A-j>", "<A-Down>" }, "<cmd>wincmd j<CR>", { desc = "Go to the window below" } },
		{ "", { "<A-k>", "<A-Up>" }, "<cmd>wincmd k<CR>", { desc = "Go to the window above" } },
		{ "", { "<A-l>", "<A-Right>" }, "<cmd>wincmd l<CR>", { desc = "Go to the right window" } },
		{
			"",
			{ "<leader><A-h>", "<leader><A-Left>" },
			"<cmd>wincmd H<CR>",
			{ desc = "Move window to the left side" },
		},
		{ "", { "<leader><A-j>", "<leader><A-Down>" }, "<cmd>wincmd J<CR>", { desc = "Move window to bottom" } },
		{ "", { "<leader><A-k>", "<leader><A-Up>" }, "<cmd>wincmd K<CR>", { desc = "Move window to top" } },
		{
			"",
			{ "<leader><A-l>", "<leader><A-Right>" },
			"<cmd>wincmd L<CR>",
			{ desc = "Move window to the right side" },
		},

		-- Splits
		{ "", "<leader>sh", ":split<Space>", { desc = "Open a horizontal split", silent = false } },
		{ "", "<leader>sv", ":vsplit<Space>", { desc = "Open a vertical split", silent = false } },
		{ "", "<leader>th", "<cmd>split term://$SHELL<CR>", { desc = "Open a terminal in a horizontal split" } },
		{ "", "<leader>tv", "<cmd>vsplit term://$SHELL<CR>", { desc = "Open a terminal in a vertical split" } },

		-- Tabs
		{ "", "<A-q>", "<cmd>tabclose<CR>", { desc = "Close the tab" } },
		{ "", "<A-t>", "<cmd>tabnew<CR>", { desc = "Open a new tab" } },
		{ "n", "<A-Tab>", "<cmd>tabnext<CR>", { desc = "Switch to the next tab" } },
		-- "n", "<S-Tab>", "<cmd>tabprev<CR>", { desc = "Switch to previous tab" } },

		-- Replace alias
		{ "n", "S", ":%s//gI<Left><Left><Left>", { desc = "Replace", silent = false } },
		{ "v", "S", ":s//gI<Left><Left><Left>", { desc = "Replace", silent = false } },

		-- Quit
		{ "", { "<leader>qq", "<C-q>" }, "<cmd>q<CR>", { desc = "Close current buffer" } },
		{ "", "<leader>qw", "<cmd>wq<CR>", { desc = "Save and close current buffer" } },
		{ "", "<leader>W", "<cmd>w<CR>", { desc = "Save current buffer" } },

		-- Clear highlights with Esc
		{ "n", "<Esc>", ":noh <CR>", { desc = "Clear highlights" } },

		-- Easier movement between wrapped lines
		{
			"",
			{ "j", "<Down>" },
			"v:count || mode(1)[0:1] == \"no\" ? \"j\" : \"gj\"",
			{ desc = "Move down", expr = true },
		},
		{
			"",
			{ "k", "<Up>" },
			"v:count || mode(1)[0:1] == \"no\" ? \"k\" : \"gk\"",
			{ desc = "Move up", expr = true },
		},

		-- Insert mode movement
		{ "i", "<C-a>", "<Home>", { desc = "Isame as 0" } },
		{ "i", "<C-h>", "<Left>", { desc = "Isame as h" } },
		{ "i", "<C-j>", "<Down>", { desc = "Isame as j" } },
		{ "i", "<C-k>", "<Up>", { desc = "Isame as k" } },
		{ "i", "<C-l>", "<Right>", { desc = "Isame as l" } },
		{ "i", "<C-d>", "<End>", { desc = "Isame as $" } },

		-- Move lines up and down
		{ "n", { "<C-A-j>", "<C-A-Down>" }, ":m .+1<CR>==", { desc = "Move the line down" } },
		{ "v", { "<C-A-j>", "<C-A-Down>" }, ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" } },
		{ "i", { "<C-A-j>", "<C-A-Down>" }, "<Esc>:m .+1<CR>==gi", { desc = "Move the line down" } },
		{ "n", { "<C-A-k>", "<C-A-Up>" }, ":m .-2<CR>==", { desc = "Move the line up" } },
		{ "v", { "<C-A-k>", "<C-A-Up>" }, ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" } },
		{ "i", { "<C-A-k>", "<C-A-Up>" }, "<Esc>:m .-2<CR>==gi", { desc = "Move the line down" } },

		-- Don't yank deleted text
		{ "v", "p", "\"_dP", { desc = "Paste without yanking" } },
		{ { "n", "v" }, "x", "\"_x", { desc = "Delete without yanking" } },
		-- { "n", "v" }, "dd", '"_dd' },
	}, { desc = "kvim" })
end
