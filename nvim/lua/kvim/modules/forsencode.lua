local function load()
	local encode_lookup = {
		[0] = "fÖrsen",
		[1] = "fÖrseN",
		[2] = "fÖrsEn",
		[3] = "fÖrsEN",
		[4] = "fÖrSen",
		[5] = "fÖrSeN",
		[6] = "fÖrSEn",
		[7] = "fÖrSEN",
		[8] = "fÖRsen",
		[9] = "fÖRseN",
		[10] = "fÖRsEn",
		[11] = "fÖRsEN",
		[12] = "fÖRSen",
		[13] = "fÖRSeN",
		[14] = "fÖRSEn",
		[15] = "fÖRSEN",
		[16] = "försen",
		[17] = "förseN",
		[18] = "försEn",
		[19] = "försEN",
		[20] = "förSen",
		[21] = "förSeN",
		[22] = "förSEn",
		[23] = "förSEN",
		[24] = "föRsen",
		[25] = "föRseN",
		[26] = "föRsEn",
		[27] = "föRsEN",
		[28] = "föRSen",
		[29] = "föRSeN",
		[30] = "föRSEn",
		[31] = "föRSEN",
		[32] = "fOrsen",
		[33] = "fOrseN",
		[34] = "fOrsEn",
		[35] = "fOrsEN",
		[36] = "fOrSen",
		[37] = "fOrSeN",
		[38] = "fOrSEn",
		[39] = "fOrSEN",
		[40] = "fORsen",
		[41] = "fORseN",
		[42] = "fORsEn",
		[43] = "fORsEN",
		[44] = "fORSen",
		[45] = "fORSeN",
		[46] = "fORSEn",
		[47] = "fORSEN",
		[48] = "forsen",
		[49] = "forseN",
		[50] = "forsEn",
		[51] = "forsEN",
		[52] = "forSen",
		[53] = "forSeN",
		[54] = "forSEn",
		[55] = "forSEN",
		[56] = "foRsen",
		[57] = "foRseN",
		[58] = "foRsEn",
		[59] = "foRsEN",
		[60] = "foRSen",
		[61] = "foRSeN",
		[62] = "foRSEn",
		[63] = "foRSEN",
		[64] = "FÖrsen",
		[65] = "FÖrseN",
		[66] = "FÖrsEn",
		[67] = "FÖrsEN",
		[68] = "FÖrSen",
		[69] = "FÖrSeN",
		[70] = "FÖrSEn",
		[71] = "FÖrSEN",
		[72] = "FÖRsen",
		[73] = "FÖRseN",
		[74] = "FÖRsEn",
		[75] = "FÖRsEN",
		[76] = "FÖRSen",
		[77] = "FÖRSeN",
		[78] = "FÖRSEn",
		[79] = "FÖRSEN",
		[80] = "Försen",
		[81] = "FörseN",
		[82] = "FörsEn",
		[83] = "FörsEN",
		[84] = "FörSen",
		[85] = "FörSeN",
		[86] = "FörSEn",
		[87] = "FörSEN",
		[88] = "FöRsen",
		[89] = "FöRseN",
		[90] = "FöRsEn",
		[91] = "FöRsEN",
		[92] = "FöRSen",
		[93] = "FöRSeN",
		[94] = "FöRSEn",
		[95] = "FöRSEN",
		[96] = "FOrsen",
		[97] = "FOrseN",
		[98] = "FOrsEn",
		[99] = "FOrsEN",
		[100] = "FOrSen",
		[101] = "FOrSeN",
		[102] = "FOrSEn",
		[103] = "FOrSEN",
		[104] = "FORsen",
		[105] = "FORseN",
		[106] = "FORsEn",
		[107] = "FORsEN",
		[108] = "FORSen",
		[109] = "FORSeN",
		[110] = "FORSEn",
		[111] = "FORSEN",
		[112] = "Forsen",
		[113] = "ForseN",
		[114] = "ForsEn",
		[115] = "ForsEN",
		[116] = "ForSen",
		[117] = "ForSeN",
		[118] = "ForSEn",
		[119] = "ForSEN",
		[120] = "FoRsen",
		[121] = "FoRseN",
		[122] = "FoRsEn",
		[123] = "FoRsEN",
		[124] = "FoRSen",
		[125] = "FoRSeN",
		[126] = "FoRSEn",
		[127] = "FoRSEN",
	}

	vim.api.nvim_create_user_command("ForsenCodeEnable", function()
		vim.keymap.set("i", "<C-BS>", "<Esc>\"_db\"_xa")
		vim.keymap.set("i", string.char(10), encode_lookup[10] .. " ")
		vim.keymap.set("i", string.char(13), encode_lookup[13] .. " ")
		for i = 32, 127 do
			vim.keymap.set("i", string.char(i), encode_lookup[i] .. " ")
		end
	end, {})

	vim.api.nvim_create_user_command("ForsenCodeDisable", function()
		vim.keymap.del("i", "<C-BS>")
		vim.keymap.del("i", string.char(10))
		vim.keymap.del("i", string.char(13))
		for i = 32, 127 do
			vim.keymap.del("i", string.char(i))
		end
	end, {})
end

return {
	load = load,
}
