return {
	{
		"tpope/vim-fugitive",
		config = function()
			-- Настроить сочетания клавиш для работы с Git
			vim.api.nvim_set_keymap("n", "<leader>gs", ":Git<CR>", { noremap = true, silent = true })     -- Git status
			vim.api.nvim_set_keymap("n", "<leader>gc", ":Git commit<CR>", { noremap = true, silent = true }) -- Git commit
			vim.api.nvim_set_keymap("n", "<leader>gp", ":Git push<CR>", { noremap = true, silent = true }) -- Git push
			vim.api.nvim_set_keymap("n", "<leader>gl", ":Git log<CR>", { noremap = true, silent = true }) -- Git log
		end,
	},
}
