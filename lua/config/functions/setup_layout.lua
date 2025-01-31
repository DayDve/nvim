vim.o.keymap = "russian-jcukenwin"
vim.o.iminsert = 0
vim.o.imsearch = 0

-- Переключение раскладки
_G.ToggleInputMethod = function()
	if vim.o.iminsert == 1 then
		vim.o.iminsert = 0
		vim.o.imsearch = 0
	else
		vim.o.iminsert = 1
		vim.o.imsearch = 1
	end
	if vim.fn.mode() == "i" then
		-- Если в режиме Insert, выходим в Normal, переключаем раскладку и возвращаемся в Insert
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("a", true, false, true), "n", true)
	end
end

vim.keymap.set(
	"n",
	"<Leader> ",
	ToggleInputMethod,
	{ desc = "Переключить раскладку клавиатуры" }
)
vim.keymap.set(
	"i",
	"qq",
	ToggleInputMethod,
	{ desc = "Переключить раскладку клавиатуры" }
)

local lualine_exists, lualine = pcall(require, "lualine")
if lualine_exists then
	local ll_config = lualine.get_config()
	local add_layout_indicator = function()
		-- Проверяем, существует ли уже индикатор раскладки
		local layout_exists = false
		for _, item in ipairs(ll_config.sections.lualine_z) do
			if
				type(item) == "table"
				and item[1] == 'function() return vim.o.iminsert == 1 and "🇷🇺" or "🇺🇸" end'
			then
				layout_exists = true
				break
			end
		end

		-- Если индикатор не найден, добавляем его
		if not layout_exists then
			table.insert(ll_config.sections.lualine_z, {
				function()
					return vim.o.iminsert == 1 and "🇷🇺" or "🇺🇸"
				end,
			})
			require("lualine").setup(ll_config)
		end
	end

	-- Добавить индикатор раскладки, если его еще нет
	add_layout_indicator()
end
