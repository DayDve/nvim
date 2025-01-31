return {
	{
		"jbyuki/venn.nvim",
		config = function()
			local vapi = vim.api
			local bkeymap_s = vapi.nvim_buf_set_keymap
			local bkeymap_d = vapi.nvim_buf_del_keymap
			local venn_mode = "S"
			local mode_desc = {
				S = { "single line", "┼" },
				D = { "double line", "╬" },
				H = { "heavy line", "╋" },
			}

			Venn_draw_mode = function(mode)
				mode = mode or "S"
				venn_mode = mode

				local description = "Line drawing mode (" .. mode_desc[mode][1] .. ")"
				bkeymap_s(0, "n", "J", "<C-v>j:VBox" .. mode:gsub("S", "") .. "<CR>", { noremap = true, silent = true })
				bkeymap_s(0, "n", "K", "<C-v>k:VBox" .. mode:gsub("S", "") .. "<CR>", { noremap = true, silent = true })
				bkeymap_s(0, "n", "L", "<C-v>l:VBox" .. mode:gsub("S", "") .. "<CR>", { noremap = true, silent = true })
				bkeymap_s(0, "n", "H", "<C-v>h:VBox" .. mode:gsub("S", "") .. "<CR>", { noremap = true, silent = true })
				bkeymap_s(0, "v", "f", ":VBox<CR>", { noremap = true, silent = true })
				bkeymap_s(0, "v", "F", "r█", { noremap = true, silent = true })
				vim.cmd('echo "' .. description .. '"')
			end

			Toggle_venn = function()
				if vim.b.venn_enabled then
					vim.cmd([[setlocal ve=]])
					vim.wo.cursorcolumn = false
					bkeymap_d(0, "n", "J")
					bkeymap_d(0, "n", "K")
					bkeymap_d(0, "n", "L")
					bkeymap_d(0, "n", "H")
					bkeymap_d(0, "n", "<Esc>")
					bkeymap_d(0, "v", "f")
					bkeymap_d(0, "v", "F")
					vapi.nvim_del_keymap("n", "<leader>s")
					vapi.nvim_del_keymap("n", "<leader>d")
					vapi.nvim_del_keymap("n", "<leader>h")
					vim.b.venn_enabled = nil
					vim.cmd('echo " "')
				else
					vim.b.venn_enabled = true
					vim.cmd([[setlocal ve=all]])
					vim.wo.cursorcolumn = true
					vapi.nvim_set_keymap(
						"n",
						"<leader>s",
						"<Cmd>lua Venn_draw_mode('S')<CR>",
						{ noremap = true, desc = "Рисование: тонкие линии" }
					)
					vapi.nvim_set_keymap(
						"n",
						"<leader>d",
						"<Cmd>lua Venn_draw_mode('D')<CR>",
						{ noremap = true, desc = "Рисование: двойные линии" }
					)
					vapi.nvim_set_keymap(
						"n",
						"<leader>h",
						"<Cmd>lua Venn_draw_mode('H')<CR>",
						{ noremap = true, desc = "Рисование: толстые линии" }
					)

					Venn_draw_mode("S")
					bkeymap_s(0, "n", "<Esc>", "<Cmd>lua Toggle_venn()<CR><Esc>", { noremap = true, silent = true })
				end
				local lualine_exists, lualine = pcall(require, "lualine")
				if lualine_exists then
					local function venn_status()
						return "DRAW[" .. mode_desc[venn_mode][2] .. "]"
					end

					if vim.b.venn_enabled then
						lualine.setup({
							sections = {
								lualine_a = { { venn_status, color = { bg = "#21ea30" } } },
							},
						})
					else
						lualine.setup({
							sections = {
								lualine_a = { "mode" },
							},
						})
					end
				end
				vim.keymap.set("n", "<leader>v", Toggle_venn, {
					noremap = true,
					silent = true,
					desc = (vim.b.venn_enabled == true and "Выкл" or "вкл") .. " режима рисования",
				})
			end

			vim.keymap.set("n", "<leader>v", Toggle_venn, { noremap = true, silent = true, desc = "Вкл режима рисования" })
		end,
	},
}
