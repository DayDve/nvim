-- Подключаем функцию Set_Config
pcall(require, "config.functions.set_config")
Set_Config(vim.opt, nil, {
	colorcolumn = "81,121", -- визуальные границы текста по левому краю
	listchars = {          -- Настройка отображения непечатных символов
		space = "·",
		tab = "‹⁃›",
		multispace = "····+",
		eol = "↵",
		nbsp = "⦸",
	},
	fillchars = { -- Настройка символов заполнителей
		vert = "│",
		fold = "⠀",
		msgsep = "‾",
		foldopen = "▾",
		foldsep = "│",
		foldclose = "▸",
	},
	modeline = true,                        -- ─┬─► Включаем поддержку modeline
	modelines = 4,                          -- ───┘
	incsearch = true,                       -- Подсветка искомого текста при вводе
	cursorline = true,                      -- Подсветка активной строки
	hidden = true,                          -- Подавление запроса на сохранение при переключении буферов
	showmatch = true,                       -- подсветка парных элементов (скобки, кавычки)
	splitbelow = true,                      -- Новые горизонтальные окна открываются под текущим.
	splitright = true,                      -- Новые вертикальные окна открываются справа от текущего.
	undofile = true,                        -- Включает создание файлов истории
	showmode = false,                       -- Отключает отображение текущего режима
	clipboard = "unnamedplus",              -- Поддержка системного буфера обмена
	termguicolors = true,                   -- включение поддержки truecolor
	foldmethod = "expr",                    -- ─────────────────────┬── настройки сворачивания
	foldexpr = "nvim_treesitter#foldexpr()", -- ─┘
	foldlevel = 99,                         -- Уровень сворачивания. Полностью развернуть.
})
vim.wo.signcolumn = "yes"                 -- Включает колонку для знаков.
vim.wo.foldcolumn = "auto:9"              -- Включает колонку для отображения символов сворачивания кода.
vim.opt.shortmess:append("c")             -- Укорачивает сообщения об изменениях, не отображая их повторно в командной строке.
vim.g.formatoptions = "cronjw1"
--
-- Настройка табуляции для разных типов файлов
Set_Config(vim.api, "nvim_create_autocmd", {
	{
		"FileType",
		{
			pattern = { "sh", "bash", "vim", "vimrc" },
			command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab",
		},
	},
	{ "FileType", { pattern = "yaml", command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab" } },
	{ "FileType", { pattern = { "lua", "go" }, command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2 smarttab" } },
	{
		"FileType",
		{ pattern = "python", command = "setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab" },
	},
})

-- Настройка отображения номеров строк
pcall(require, "config.functions.line_numbers")
-- Настраиваем открытие файла из require
pcall(require, "config.functions.open_require")
-- фикс foldcolumn
pcall(require, "config.functions.fix_foldcolumn")
-- настройка переключения раскладки
pcall(require, "config.functions.setup_layout")
