return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		config = function()
			local ls = require("luasnip")
			local s = ls.snippet
			local t = ls.text_node
			local i = ls.insert_node
			local extras = require("luasnip.extras")
			local rep = extras.rep
			local fmt = require("luasnip.extras.fmt").fmt
			local c = ls.choice_node
			local f = ls.function_node
			local d = ls.dynamic_node
			local sn = ls.snippet_node

			vim.keymap.set({ "i", "s" }, "<A-n>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end)

			vim.keymap.set({ "i", "s" }, "<A-k>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<A-j>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true })

			ls.add_snippets("sh", {
				s("#!", {
					t("#!/usr/bin/bash"),
				}),
			})
		end,
	},
}
