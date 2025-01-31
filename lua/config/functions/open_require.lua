--[[
Настраиваем открытие файла из директивы require
по нажатию <leader>rf
по аналокии с открытием файла под курсором по gf
 ]]
local function open_require_file()
	-- Получаем текущую строку с курсором
	local line = vim.api.nvim_get_current_line()

	-- Ищем имя модуля для `require("...")` или `pcall(require, "...")`
	local module_name = line:match("require%s*%(%s*[\"']([%w%.%/_]+)[\"']%s*%)")
		or line:match("pcall%s*%(%s*require%s*,%s*[\"']([%w%.%/_]+)[\"']%s*%)")

	if not module_name then
		print("Не найден модуль для `require` или `pcall(require, ...)`.")
		return
	end

	-- Получаем путь к директории конфигурации и создаем полный путь к файлу
	local config_path = vim.fn.stdpath("config")
	local file_path = config_path .. "/lua/" .. module_name:gsub("%.", "/") .. ".lua"

	-- Проверяем существование файла с помощью vim.fn.filereadable
	if vim.fn.filereadable(file_path) == 1 then
		vim.cmd("edit " .. file_path)
	else
		print("Файл не найден: " .. file_path)
	end
end

-- Привязка функции к сочетанию клавиш (например, <leader>rf)
vim.keymap.set(
	"n",
	"gr",
	open_require_file,
	{ noremap = true, silent = true, desc = "Open file from 'require' section" }
)
