return {
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		vim.api.nvim_set_hl(0, "DbIcon", { fg = "#96cc81", bg = "#3b3b3b", bold = true }),
		vim.api.nvim_set_hl(0, "DbCaption", { fg = "#dfa1ef", bg = "#3b3b3b", bold = true }),
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
							icon_hl = "DbIcon",
							desc = "Проводник",
							group = "DbCaption",
							key = "e",
							keymap = "SPC e",
							key_hl = "Number",
							action = ":NeoTreeInFileDir",
						},
						{
							icon = "󰈞 ",
							icon_hl = "DbIcon",
							desc = "Telescope",
							group = "DbCaption",
							key = "t",
							keymap = "SPC f f",
							key_hl = "DbIcon",
							action = ":WhichKey <leader>t",
						},
						{
							icon = " ",
							icon_hl = "DbIcon",
							desc = "Гор.клавиши",
							group = "DbCaption",
							key = "h",
							key_hl = "Number",
							action = ":FloatingHelp hotkeys",
						},
						{
							icon = "⊗ ",
							icon_hl = "Title",
							desc = "Закрыть dashboard",
							desc_hl = "String",
							key = "c",
							key_hl = "Number",
							action = ":enew",
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
