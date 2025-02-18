return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		vim.api.nvim_set_hl(0, "DbIcon", { fg = "#8EEE55", bg = "#3b3b3b", bold = true }),
		vim.api.nvim_set_hl(0, "DbBlue", { fg = "#51A0CE", bg = "#3b3b3b", bold = true }),
		vim.api.nvim_set_hl(0, "DbViolet", { fg = "#7F5AD4", bg = "#3b3b3b", bold = true }),
		vim.api.nvim_set_hl(0, "DbBrown", { fg = "#FFB55B", bg = "#3b3b3b", bold = true }),
		vim.api.nvim_set_hl(0, "DbGreen", { fg = "#7CB35C", bg = "#3b3b3b", bold = true }),
		config = function()
			require("dashboard").setup({
				config = {
					header = {
						"",
						"╔═════════════════════════════════════════════╗ ",
						"║ ◍                 ▃▃                      ◍ ║░",
						"║                  🭅██▊                       ║░",
						"║                 🭅██▛  because               ║░",
						"║                🭅██▛          I              ║░",
						"║               🭅███▃▃▃▃▃▃       can          ║░",
						"║              🭅█▛▟█████████▙▖                ║░",
						"║            ▗▟██▐████████████▙               ║░",
						"║          ▗▟████▐█████████████▙              ║░",
						"║        ▗▟█████▛▐█▛▘▜██████▙▀▜█▖             ║░",
						"║        ███████▌▐███▖███████▛▟█▙             ║░",
						"║       ▟███████▌████████████▌███▖            ║░",
						"║       ████████▙▀██████████▛▟███▙            ║░",
						"║       ▜████████▙▚▃▜████▛▀▃▟██▙▜█▙           ║░",
						"║       ▕█████████▙▜████▚█▙▜████▙▞▀▍      ▃▃  ║░",
						"║   ░░░░░▜█████████▆▆▆▆▆████▄▞▀▀▜███▙▃▂▀▜███▙ ║░",
						"║ ░░░░░░░░▝███████████▙▜█████████▄▀▜████▙██▀▀ ║░",
						"║   ░░░░░░░░▝▀▜████████▙▜▀▀▀▔▔▀██▛▀▚▀▜██▛     ║░",
						"║   ░░░░░░░░░░░░░░░▔▀▜████▄▄▄░░░░░░░░░░░ ▄██  ║░",
						"║      ░░░░░░░░░░░░░░░ ▀▀██████▄▄▂▂▂▂▄▄████▀  ║░",
						"║          ░░░░░░░░░░░░░░░░░ ▀▀▀███████▀▀▀    ║░",
						"║ ◍         ░░░░░░░░░░░░░░░░░    ▔▔▔▔       ◍ ║░",
						"╚═════════════════════════════════════════════╝░",
						" ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
						"",
					},
					disable_move = true,
					shortcut = {
						{
							icon = "󰙅 ",
							icon_hl = "Dbicon",
							desc = "Проводник",
							group = "DbGreen",
							key = "e",
							keymap = "SPC e",
							key_hl = "DbIcon",
							action = ":NeoTreeInFileDir",
						},
						{
							icon = "󰈞 ",
							icon_hl = "Dbicon",
							desc = "Telescope",
							group = "DbBlue",
							key = "t",
							keymap = "SPC f f",
							key_hl = "Dbicon",
							action = ":WhichKey <leader>t",
						},
						{
							icon = " ",
							icon_hl = "Dbicon",
							desc = "Гор.клавиши",
							group = "DbBrown",
							key = "h",
							key_hl = "Number",
							action = ":FloatingHelp hotkeys",
						},
						{
							icon = "⊗ ",
							icon_hl = "Title",
							desc = "Закрыть dashboard",
							key = "c",
							key_hl = "Number",
							action = ":bdelete",
						},
					},
					footer = {
						"",
						"═════════════════════════════════════════════",
					},
				},
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
