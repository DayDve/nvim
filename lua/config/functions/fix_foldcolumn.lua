_G.FixFoldColumn = function()
	local cursor_pos = vim.api.nvim_win_get_cursor(0) -- Запоминаем текущую позицию курсора
	local current_line = cursor_pos[1]               -- Текущая строка

	-- Получаем синтаксическое дерево для текущего буфера
	local parser = vim.treesitter.get_parser(0)
	local tree = parser:parse()[1]
	local root = tree:root()

	-- Получаем узел на текущей строке
	local node_at_cursor = root:named_descendant_for_range(current_line - 1, 0, current_line, 0)

	-- Проверяем, является ли узел комментарием
	local is_comment = false
	if node_at_cursor then
		local node_type = node_at_cursor:type()
		if node_type == "comment" then
			is_comment = true
		end
	end

	-- Если текущая строка является комментарием, ищем строку без комментариев
	if is_comment then
		local next_line = current_line + 1
		while true do
			local node = root:named_descendant_for_range(next_line - 1, 0, next_line, 0)
			if node and node:type() ~= "comment" then
				-- Перемещаем курсор на строку без комментария
				vim.api.nvim_win_set_cursor(0, { next_line, 0 })
				break
			end
			next_line = next_line + 1
			if next_line > vim.fn.line("$") then
				break
			end
		end
	end

	-- Выполняем команду fold
	vim.cmd("normal! zx")

	-- Возвращаем курсор на исходную позицию
	vim.api.nvim_win_set_cursor(0, cursor_pos)
end
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.go", "*.py", "*.sh", "*.lua", "*.json", "*.yaml", "*.yml" },
	callback = FixFoldColumn,
})
