return {
	{
		"nat-418/boole.nvim",
		config = function()
			require("boole").setup({
				mappings = {
					increment = "<C-a>",
					decrement = "<C-x>",
				},
				-- User defined loops
				additions = {
					{ "Foo", "Bar" },
					{ "&&",  "||" },
					{ "tic", "tac", "toe" },
					{ "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun" },
				},
				allow_caps_additions = {
					{ "Yes", "No" },
					{ "True",   "False" },
					{ "enable", "disable" },
					-- enable → disable
					-- Enable → Disable
					-- ENABLE → DISABLE
				},
			})
		end,
	},
}
