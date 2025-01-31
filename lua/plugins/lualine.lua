return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")

			lualine.setup({
				options = {
					section_separators = { left = "🭀", right = "🭋" },
					component_separators = { left = "\\", right = "/" },
					icons_enabled = true,
				},
				tabline = {
					lualine_a = { "buffers" }, -- Для отображения открытых буферов
					lualine_b = { "tabs" }, -- Для отображения вкладок
				},
			})
		end,
	},
}
