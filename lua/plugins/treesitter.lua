return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- A list of parser names, or "all" (the listed parsers MUST always be installed)
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"markdown",
					"markdown_inline",
					"go",
					"python",
					"bash",
					"yaml",
					"json",
					"xml",
				},
				ignore_install = {},
				auto_install = true,
				sync_install = false,
				highlight = {
					additional_vim_regex_highlighting = false,
					custom_captures = {},
					disable = {},
					enable = true,
				},
				indent = {
					enable = true, -- Включаем автоотступы
				},
				fold = {
					enable = true, -- Включаем сворачивание
				},
				-- Добавлено поле modules
				modules = {},
			})
			vim.api.nvim_command("TSUpdate")
		end,
	},
}
