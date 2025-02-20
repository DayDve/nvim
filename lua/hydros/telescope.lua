local Hydra = require("hydra")
local cmd = require("hydra.keymap-util").cmd
TelescopeHydra = Hydra({
	name = "Telescope",
	hint = [[
┌────────────────────────────────────────────────────┐
│                _f_: files     _b_: buffers             │
│  🭇🬭🬭🬭🬭🬭🬭🬭🬭🬼    _r_: recent    _g_: live grep           │
│ 🭉🭁🭠🭘    🭣🭕🭌🬾   _p_: projects  _/_: search in file      │
│ 🭅█ ▁     █🭐                                       │
│ ██🬿      🭊██   _k_: keymaps   _u_: undotree            │
│🭋█🬝🮄🮄🮄🮄🮄🮄🮄🮄🬆█🭀               _c_: execute command     │
│🭤🭒🬺🬹🬱🬭🬭🬭🬭🬵🬹🬹🭝🭙               _;_: commands history    │
│                _O_: options   _?_: search history      │
│                                                    │
│                 _<Enter>_: Telescope  _<Esc>_          │
└────────────────────────────────────────────────────┘
]],
	config = {
		color = "teal",
		invoke_on_body = true,
		hint = {
			position = { "middle" },
			float_opts = {
				border = "shadow",
			},
		},
	},
	mode = "n",
	body = "<Leader>t",
	heads = {
		{ "b", cmd("Telescope buffers") },
		{ "f", cmd("Telescope find_files") },
		{ "r", cmd("Telescope oldfiles") },
		{ "g", cmd("Telescope live_grep") },
		{ "k", cmd("Telescope keymaps") },
		{ "O", cmd("Telescope vim_options") },
		{ "p", cmd("Telescope projects"), { desc = "projects" } },
		{ "/", cmd("Telescope current_buffer_fuzzy_find"), { desc = "search in file" } },
		{ "?", cmd("Telescope search_history"), { desc = "search history" } },
		{ ";", cmd("Telescope command_history"), { desc = "command-line history" } },
		{ "c", cmd("Telescope commands"), { desc = "execute command" } },
		{ "u", cmd("silent! %foldopen! | UndotreeToggle"), { desc = "undotree" } },
		{
			"<Enter>",
			cmd("Telescope<CR>"),
			{ desc = "list all pickers" },
		},
		{ "<Esc>", nil, { exit = true, nowait = false } },
	},
})
