return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local lualine = require("lualine")
			local section_separators = is_android and { left = "", right = "" } or { left = "🭀", right = "🭋" }
			lualine.setup({
				options = {
					section_separators = section_separators,
					component_separators = { left = "\\", right = "/" },
					icons_enabled = true,
				},
				tabline = {
					lualine_a = { "buffers" }, -- Для отображения открытых буферов
					lualine_z = { "tabs" }, -- Для отображения вкладок
				},
			})
		end,
	},
}
