local check_file = vim.fn.stdpath("cache") .. "/lazy_last_check.txt"
local function last_check_today()
	-- Путь к файлу, в котором будет храниться информация о последней проверке

	-- Проверяем, существует ли файл
	if vim.fn.filereadable(check_file) == 1 then
		local file = io.open(check_file, "r")
		if file then
			local last_check = file:read("*all")
			if last_check then
				file:close()

				-- Если дата последней проверки совпадает с сегодняшней, возвращаем true
				local today = os.date("%Y-%m-%d")
				return last_check == today
			else
				file:close()
			end
		end
	end

	return false
end

local function update_last_check()
	local file, err = io.open(check_file, "w")
	if not file then
		-- В случае ошибки открытия файла, выводим ошибку в лог
		vim.api.nvim_err_writeln("Failed to open file for writing: " .. err)
		return
	end

	-- Получаем текущую дату в формате "YYYY-MM-DD"
	local today = tostring(os.date("%Y-%m-%d")) -- Явное преобразование в строку

	-- Записываем текущую дату в файл
	local success, write_err = file:write(today)
	if not success then
		-- Если произошла ошибка записи, выводим ошибку в лог
		vim.api.nvim_err_writeln("Failed to write to file: " .. write_err)
	end

	-- Закрываем файл
	file:close()
end

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if not last_check_today() then
			print("Проверка обновлений плагинов...")
			local lazy = require("lazy")
			local hydra_exists, hydra = pcall(require, "hydra")
			local updates = lazy.check({ show = false, wait = true })
			local plugins_with_updates = {}

			-- Собираем плагины с обновлениями
			for plugin, data in pairs(updates._plugins) do
				if data._.updates then
					table.insert(plugins_with_updates, plugin)
				end
			end

			-- Если есть обновления, запускаем Hydra
			if #plugins_with_updates > 0 then
				if hydra_exists then
					local upddialog = hydra({
						name = "Install Updates",
						hint = [[
Доступны обновления для:

]] .. table.concat(plugins_with_updates, "\n") .. [[


      Установить?

     Да(_y_)  Нет(_n_)
]],
						config = {
							color = "teal",
							hint = {
								position = "middle",
								float_opts = {
									border = "rounded",
								},
							},
						},
						mode = "n",
						heads = {
							{
								"y",
								function()
									lazy.update({ show = true })
								end,
								{ desc = "Update Plugins" },
							},
							{ "n", nil, { exit = true, nowait = false } },
						},
					})
					-- Активируем гидру после её создания
					upddialog:activate()
				else
					vim.notify("Есть обновления для:\n" .. table.concat(plugins_with_updates, "\n"))
				end
			else
				print("Обновлений плагинов не найдено")
			end
			update_last_check()
		end
	end,
})
