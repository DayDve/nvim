return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files,
				{ noremap = true, silent = true, desc = "Telescope: поиск файлов" })
			vim.keymap.set("n", "<leader>fw", builtin.live_grep,
				{ noremap = true, silent = true, desc = "Telescope: поиск текста" })
			vim.keymap.set("n", "<leader>bl", builtin.buffers,
				{ noremap = true, silent = true, desc = "Telescope: список буферов" })
			-- vim.keymap.set('n', '<Tab>', builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
				noremap = true,
				silent = true,
				desc = "Telescope: список доступных справочных материалов",
			})
			vim.keymap.set("n", "<leader>gb", builtin.git_branches,
				{ noremap = true, silent = true, desc = "Telescope: список веток Git" })
			--[[
			vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})
			vim.keymap.set("n", "<leader>gs", builtin.git_status, {})
]]
			--
			vim.keymap.set("n", "<leader>Ls", builtin.lsp_document_symbols, {})
			vim.keymap.set(
				"n",
				"gr",
				builtin.lsp_references,
				{ noremap = true, silent = true, desc = "Telescope: Lists LSP references for word under the cursor" }
			)
			vim.keymap.set("n", "gd", builtin.lsp_definitions, {
				noremap = true,
				silent = true,
				desc =
				"telescope: Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope",
			})
			-- Telescope ignore patterns
			local telescope_ignore_patterns = {
				"%.nextcloud", -- заглушки Nextcloud
				-- изображения
				"%.png",
				"%.jpg",
				"%.jpeg",
				"%.gif",
				"%.bmp",
				"%.webp",
				-------------------
				-- другие изображения
				"%.ico",
				-------------------
				-- документы
				"%.pdf",
				"%.doc?",
				"%.ppt?",
				"%.xls?",
				"%.odt",
				-------------------
				-- видео
				"%.mp4",
				"%.mkv",
				"%.avi",
				"%.mov",
				"%.webm",
				-- аудио
				"%.mp3",
				"%.wav",
				"%.ogg",
				-------------------
				-- архивы
				"%.zip",
				"%.tar",
				"%.gz",
				"%.rar",
				"%.tgz",
				"%.bz2",
				"%.7z",
				"%.wim",
				"%.deb",
				"%.rpm",
				-------------------
				-- прочее
				"%.ttf",
				"%.otf",
				"%.ttc",
				"%.exe",
				"%.com",
				"%.apk",
				"%.torrent",
				"%.pyc",
				"%.sqlite",
			}
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = telescope_ignore_patterns,
				},
			})
		end,
	},
}
