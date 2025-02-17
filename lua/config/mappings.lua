local splitwindow = function(type)
	local split_type = {
		V = { "vsplit", "wincmd h" },
		H = { "split", "wincmd k" },
	}
	return function()
		local win_count = #vim.api.nvim_list_wins()
		local buf_count = #vim.api.nvim_list_bufs()
		if win_count == 1 and buf_count > 1 then
			vim.cmd(split_type[type][1])
			vim.cmd("bnext")
		else
			vim.cmd(split_type[type][2])
			vim.cmd("only")
		end
	end
end
Set_Config(vim.keymap, "set", {
	{
		"n",
		"<Esc>H",
		":set list!<CR>",
		{ noremap = true, silent = true, desc = "Переключить непечатные символы" },
	},
	{
		"n",
		"<Esc>s",
		":set hlsearch!<CR>",
		{
			noremap = true,
			silent = true,
			desc = "Переключение выделения результатов поиска",
		},
	},
	{
		"n",
		"<Esc>f",
		"<C-w>gf",
		{
			noremap = true,
			silent = true,
			desc = "Открыть файл под курсором в новой вкладке",
		},
	},
	{ "n", "<leader>bn", ":bnext<CR>", { noremap = true, silent = true, desc = "Буферы: следующий" } },
	{ "n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true, desc = "Буферы: удалить" } },
	{
		"n",
		"<leader>bp",
		":bprevious<CR>",
		{ noremap = true, silent = true, desc = "Буферы: предыдущий" },
	},
	{
		"n",
		"<leader>bv",
		splitwindow("V"),
		{ noremap = true, silent = true, desc = "Буферы: разделить по вертикали" },
	},
	{
		"n",
		"<leader>bh",
		splitwindow("H"),
		{ noremap = true, silent = true, desc = "Буферы: разделить по горизонтали" },
	},
	{
		"n",
		"<leader><Tab>c",
		":tabnew | Dashboard<CR>",
		{ noremap = true, silent = true, desc = "Табы: новая" },
	},
	{
		"n",
		"<leader><Tab>x",
		":tabclose<CR>",
		{ noremap = true, silent = true, desc = "Табы: закрыть текущую" },
	},
	{
		"n",
		"<leader><Tab>n",
		":tabnext<CR>",
		{ noremap = true, silent = true, desc = "Табы: следующая" },
	},
	{
		"n",
		"<leader><Tab>p",
		":tabprevious<CR>",
		{ noremap = true, silent = true, desc = "Табы: предыдущая" },
	},
})
