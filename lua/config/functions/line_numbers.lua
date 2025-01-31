--[[
Настраиваем отображение столбца с номерами строк
ALT+n переключает вид столбца с номерами строк (по кругу):
 - Стандартная нумерация
 - Относительная нумерация
 - Нумерация отключена
 ]]
_G.ToggleLineNumbers = function()
	if vim.wo.number then
		vim.wo.relativenumber = not vim.wo.relativenumber
		if not vim.wo.relativenumber then
			vim.wo.number = false
		end
	else
		vim.wo.number = true
	end
end
Set_Config(vim.opt, nil, {
	number = true,
	numberwidth = 5,
	relativenumber = false,
})
vim.api.nvim_set_hl(0, "LineNr", { fg = "#d7af5f", bg = "#3b3b3b" })
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#d7af5f", bg = "#343434" })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#d7af5f", bg = "#3b3b3b" })
vim.api.nvim_set_keymap("n", "<Esc>n", ":lua ToggleLineNumbers()<CR>", {
	noremap = true,
	silent = true,
	desc = "Переключение отображения номеров строк",
})
