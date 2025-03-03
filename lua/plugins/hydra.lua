--[[
 ██   ██ 🭖█🭀  🭋█🭡 █████🭍🬾  █████🭍🬾   🭋██🭀     ⠄⠄⣴⣶⣤⡤⠦⣤⣀⣤⠆⠄⠄⠄⠄⠄⣈⣭⣭⣿⣶⣿⣦⣼⣆⠄⠄⠄⠄⠄⠄⠄⠄
 ██   ██ 🭦█🭐  🭅█🭛 ██  🭦█🭎  ██  🭦█🭎   🭅██🭐     ⠄⠄⠄⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦⠄⠄⠄⠄⠄⠄
 ██   ██  🭖█🭀🭋█🭡  ██   ██  ██   ██  🭋█🭡🭖█🭀    ⠄⠄⠄⠄⠄⠈⠄⠄⠄⠈⢿⣿⣟⠦⠄⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄⠄⠄⠄⠄
 ██   ██  🭦█🭐🭅█🭛  ██   ██  ██   ██  🭅█🭛🭦█🭐    ⠄⠄⠄⠄⠄⠄⠄⠄⠄⠄⣸⣿⣿⢧⠄⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄⠄⠄⠄
 ██   ██   🭖██🭡   ██   ██  ██  🭊█🭡 🭋█🭡  🭖█🭀   ⠄⠄⢀⠄⠄⠄⠄⠄⠄⢠⣿⣿⣿⠈⠄⠄⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀⠄⠄
 ███████   🭦██🭛   ██   ██  █████🭠🭗 🭅█🭛██🭦█🭐   ⠄⠄⢠⣧⣶⣥⡤⢄⠄⣸⣿⣿⠘⠄⠄⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄⠄
 ██   ██    ██    ██   ██  ██ 🭖█🭀  █🭡    🭖█🭀  ⠄⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷⠄⠄⠄⢊⣿⣿⡏⠄⠄⢸⣿⣿⡇⠄⢀⣠⣄⣾⠄⠄⠄
 ██   ██    ██    ██   ██  ██ 🭦█🭐  █🭛    🭦█🭐  ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀⠄⢸⢿⣿⣿⣄⠄⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄⠄
 ██   ██    ██    ██   ██  ██  🭖█🭀 🭡      🭖█🭀 ⠙⠃⠄⠄⠄⣼⣿⡟⠌⠄⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿⠐⣿⣿⡇⠄⠛⠻⢷⣄
 ██   ██    ██    ██   ██  ██  🭦█🭐 🭛      🭦█🭐 ⠄⠄⠄⠄⠄⢻⣿⣿⣄⠄⠄⠄⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟⠄⠫⢿⣿⡆⠄⠄⠄⠁
 ██   ██    ██    ██████🭠  ██   🭖█🭀        🭖█🭀 ⠄⠄⠄⠄⠄⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃⠄⠄⠄⠄
 ]]
return {
	{
		"nvimtools/hydra.nvim",
		config = function()
			local hydros_dir = vim.fn.stdpath("config") .. "/lua/hydros"
			for _, file in pairs(vim.split(vim.fn.glob(hydros_dir .. "/*.lua"), "\n")) do
				local reqstr = file:gsub(vim.fn.stdpath("config") .. "/lua/", ""):gsub("/", "."):gsub(".lua$", "")
				require(reqstr)
			end
		end,
	},
}
