
<div align="center">
  <h1>🚀 Neovim DD-config</h1>
  <p>Моя персональная конфигурация Neovim с удобными настройками и полезными плагинами.</p>
</div>

<hr>


<div align="center"><p>
    <img alt="Neovim Version" src="https://img.shields.io/badge/Neovim-0.10.1-blueviolet?style=for-the-badge&logo=neovim" />
    <img alt="License" src="https://img.shields.io/github/license/daydve/nvim?style=for-the-badge&logo=open-source-initiative&color=green" />
    <img alt="Last Commit" src="https://img.shields.io/github/last-commit/daydve/nvim?style=for-the-badge&logo=git&color=yellow" />
</p></div>

```
			╔═════════════════════════════════════════════╗
			║ ◍                 ▃▃                      ◍ ║░
			║                  🭅██▊                      ║░
			║                 🭅██▛  because              ║░
			║                🭅██▛          I             ║░
			║               🭅███▃▃▃▃▃▃       can         ║░
			║              🭅█▛▟█████████▙▖               ║░
			║            ▗▟██▐████████████▙               ║░
			║          ▗▟████▐█████████████▙              ║░
			║        ▗▟█████▛▐█▛▘▜██████▙▀▜█▖             ║░
			║        ███████▌▐███▖███████▛▟█▙             ║░
			║       ▟███████▌████████████▌███▖            ║░
			║       ████████▙▀██████████▛▟███▙            ║░
			║       ▜████████▙▚▃▜████▛▀▃▟██▙▜█▙           ║░
			║       ▕█████████▙▜████▚█▙▜████▙▞▀▍      ▃▃  ║░
			║   ░░░░░▜█████████▆▆▆▆▆████▄▞▀▀▜███▙▃▂▀▜███▙ ║░
			║ ░░░░░░░░▝███████████▙▜█████████▄▀▜████▙██▀▀ ║░
			║   ░░░░░░░░▝▀▜████████▙▜▀▀▀▔▔▀██▛▀▚▀▜██▛     ║░
			║   ░░░░░░░░░░░░░░░▔▀▜████▄▄▄░░░░░░░░░░░ ▄██  ║░
			║      ░░░░░░░░░░░░░░░ ▀▀██████▄▄▂▂▂▂▄▄████▀  ║░
			║          ░░░░░░░░░░░░░░░░░ ▀▀▀███████▀▀▀    ║░
			║ ◍         ░░░░░░░░░░░░░░░░░    ▔▔▔▔       ◍ ║░
			╚═════════════════════════════════════════════╝░
			 ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
```

## 📁 Структура конфигурации

- Основные настройки Neovim хранятся в файле `config/common.lua`.
- Для удобства задания настроек используется функция `Set_Config`.
- Настройки привязки хоткеев находятся в файле `lua/config/mappings.lua`.

## 🔌 Плагины

Конфигурация использует следующие плагины:

	boole.nvim         Comment.nvim       dashboard-nvim     everforest-nvim
	fine-cmdline.nvim  floating-help.nvi  friendly-snippets  gitsigns.nvim
	hydra.nvim         lazy.nvim          lazydev.nvim       lualine.nvim
	LuaSnip            mason.nvim         mini.move          nvim-cmp
	neo-tree.nvim      none-ls.nvim       nui.nvim           nvim-web-devicons
	nvim-lspconfig     nvim-surround      nvim-treesitter    undotree
	nvim-window-picke  plenary.nvim       telescope.nvim     which-key.nvim
	venn.nvim          vim-fugitive       vim-vsnip
	luvit-meta         nvim-autopairs     rainbow_csv.nvim


### 📦 Менеджер плагинов

Используется **Lazy.nvim**.
Плагины устанавливаются путем создания файла `<pluginname>.lua` в папке `lua/plugins`.
Структуру файла можно посмотреть на примере файлов уже установленных плагинов.

### 🗑️ Отключение плагинов

Чтобы удалить(отключить) плагин, достаточно удалить соответствующий файл
(убрать расширение lua у файла) в папке `lua/plugins`.

## ⚙️ Установка

1. Поместить конфигурацию в папку `~/.config/nvim` или использовать переменные
окружения для кастомного пути (`XDG_CONFIG_HOME` и `NVIM_APPNAME`).

## 🎨 Корректное отображение интерфейса

Для корректного отображения всех элементов интерфейса необходимо установить [Nerd Fonts](https://www.nerdfonts.com).

Шрифт, которым пользуюсь я, находится в папке `fonts`.

## 📌 Зависимости

Для корректной работы конфигурации (точнее для установки модулей при помощи Mason) потребуются:

- **python3-venv**
- **cargo** — для установки shellharden
- **luarocks** — для Lua модулей
- **unzip** — для распаковки архивов
- **npm** — для prettierd
- **компилятор C** (gcc или clang) — для treesitter

## ⌨️ Хоткеи

Краткую справку по используемым сочетаниям клавиш можно посмотреть с помощью команды:

```
:h hotkeys
```

---

<div align="center">
    <b>🔥 Because I can 🔥</b>
</div>
