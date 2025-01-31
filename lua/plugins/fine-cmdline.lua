return {
	{
		"VonHeikemen/fine-cmdline.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("fine-cmdline").setup({})
			vim.keymap.set("n", "<M-;>", ":FineCmdline<CR>", { noremap = true, silent = true })
		end,
	},
}
