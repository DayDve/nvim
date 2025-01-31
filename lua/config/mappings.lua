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
		"<Esc>h",
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
	{
		"n",
		"<leader>bp",
		":bprevious<CR>",
		{ noremap = true, silent = true, desc = "Буферы: предыдущий" },
	},
	{
		"n",
		"<Esc>v",
		splitwindow("V"),
		{ noremap = true, silent = true, desc = "Буферы: разделить по вертикали" },
	},
	{
		"n",
		"<leader>bv",
		splitwindow("V"),
		{ noremap = true, silent = true, desc = "Буферы: разделить по вертикали" },
	},
	{
		"n",
		"<Esc>h",
		splitwindow("H"),
		{ noremap = true, silent = true, desc = "Буферы: разделить по горизонтали" },
	},
	{
		"n",
		"<leader>bh",
		splitwindow("H"),
		{ noremap = true, silent = true, desc = "Буферы: разделить по горизонтали" },
	},
	{
		"n",
		"<leader><Tab>",
		":tabnext<CR>",
		{ noremap = true, silent = true, desc = "Табы: следующая" },
	},
	{
		"n",
		"<leader><S-Tab>",
		":tabprevious<CR>",
		{ noremap = true, silent = true, desc = "Табы: предыдущая" },
	},
})
