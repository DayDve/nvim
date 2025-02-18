local Hydra = require("hydra")
Hydra({
	name = "Resize window",
	mode = "n",
	body = "<C-w>",
	heads = {
		{ ">", "<C-w>>" },
		{ "<", "<C-w><", { desc = "←/→" } },
		{ "+", "<C-w>+" },
		{ "-", "<C-w>-", { desc = "↑/↓" } },
	},
})
