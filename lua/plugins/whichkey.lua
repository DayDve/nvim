return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			layout = {
				width = { min = 20 },
				spacing = 3,
			},
			win = {
				width = 60,
				height = 30,
				relative = "editor", -- делаем окно плавающим относительно редактора
				border = "single", -- граница окна
				title = true,
				title_pos = "center",
				zindex = 1000,
				col = math.huge,
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
}
