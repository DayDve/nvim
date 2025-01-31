return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information

			{
				"s1n7ax/nvim-window-picker",
				version = "2.*",
				config = function()
					require("window-picker").setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { "neo-tree", "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { "terminal", "quickfix" },
							},
						},
					})
				end,
			},
		},
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
			function OpenNeoTreeInFileDir()
				-- Получаем путь к текущему файлу
				local current_file = vim.api.nvim_buf_get_name(0)
				-- Если файл открыт
				if current_file ~= "" then
					local file_dir = vim.fn.fnamemodify(current_file, ":p:h") -- Получаем директорию файла
					vim.cmd("Neotree float focus " .. file_dir) -- Открываем Neo-tree в этой директории
					-- vim.cmd("normal P")
				else
					vim.cmd("Neotree float focus") -- Иначе открываем Neo-tree в текущей директории
					-- vim.cmd("normal P")
				end
				-- Применяем подсветку
				vim.cmd("hi NeoTreeCursorLine guibg=#3e4452 guifg=#ffffff")
			end

			-- Создаем команду для вызова функции
			vim.api.nvim_create_user_command("NeoTreeInFileDir", OpenNeoTreeInFileDir, {})

			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1]])

			-- Добавляем маппинги для вызова Neo-tree
			vim.keymap.set(
				"n",
				"<leader>e",
				OpenNeoTreeInFileDir,
				{ noremap = true, silent = true, desc = "Файловый менеджер" }
			)

			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
			require("neo-tree").setup({
				filesystem = {
					filtered_items = {
						visibled = false,
						hide_by_pattern = { -- uses glob style patterns
							"*.nextcloud", -- заглушки Nextcloud
							-- изображения
							"*.png",
							"*.jpg",
							"*.jpeg",
							"*.gif",
							"*.bmp",
							"*.webp",
							-------------------
							-- другие изображения
							"*.ico",
							-------------------
							-- документы
							"*.pdf",
							"*.doc*",
							"*.ppt*",
							"*.xls*",
							"*.odt",
							-------------------
							-- видео
							"*.mp4",
							"*.mkv",
							"*.avi",
							"*.mov",
							"*.webm",
							-- аудио
							"*.mp3",
							"*.wav",
							"*.ogg",
							-------------------
							-- архивы
							"*.zip",
							"*.tar",
							"*.gz",
							"*.rar",
							"*.tgz",
							"*.bz2",
							"*.7z",
							"*.wim",
							"*.deb",
							"*.rpm",
							-------------------
							-- прочее
							"*.ttf",
							"*.otf",
							"*.ttc",
							"*.exe",
							"*.com",
							"*.apk",
							"*.torrent",
						},
					},
					indent = {
						with_markers = true,
						indent_marker = "│",
						last_indent_marker = "└",
						highlight = "NeoTreeIndentMarker",
					},
					highlight_opened_files = "all", -- Подсвечивать все открытые файлы
					window = {
						mappings = {
							["<CR>"] = "open",
							["l"] = "open",
							["h"] = "close_node",
							["<esc>"] = "revert_preview",
							["F"] = "filter_as_you_type",
						},
						position = "current", -- позиция окна Neo-tree
						width = 40, -- ширина окна
					},
				},
			})
		end,
	},
}
