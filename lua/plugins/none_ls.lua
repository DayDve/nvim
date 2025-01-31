return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "jay-babu/mason-null-ls.nvim" },
		config = function()
			local null_ls = require("null-ls")
			local nb = null_ls.builtins

			-- Настройка none-ls
			null_ls.setup({
				require("mason-null-ls").setup({
					debug = true,
					ensure_installed = {
						-- Go
						"golangci-lint",
						"goimports-reviser",

						-- Python
						"pylint",
						"black",

						-- Bash
						"shellcheck",
						"shfmt",
						"shellharden",

						-- Lua
						"lua-language-server",
						"luacheck",
						"stylua",

						-- JSON
						"jq",

						-- YAML
						"yamllint",
						"yamlfmt",
						-- js, json, css, html
						"prettierd",
						-- Dockerfile
						"hadolint",
					},
					automatic_installation = true,
				}),
				sources = {
					nb.formatting.stylua,
					nb.formatting.stylua.with({
						extra_args = {
							"--indent-width",
							"2",
							"--column-width",
							"150",
						},
					}),
					-- nb.completion.spell,
					nb.formatting.black,
					nb.diagnostics.pylint.with({
						diagnostics_postprocess = function(diagnostic)
							diagnostic.code = diagnostic.message_id
						end,
					}),
					nb.formatting.shfmt,
					nb.formatting.shfmt.with({
						extra_args = { "-i", "2", "-kp" },
					}),
					nb.formatting.shellharden,
					nb.hover.printenv,
					nb.formatting.gofmt,
					nb.formatting.goimports,
					nb.formatting.goimports_reviser,
					nb.diagnostics.hadolint,
					nb.diagnostics.yamllint,
					nb.formatting.yamlfmt,
					nb.formatting.yamlfmt.with({
						extra_args = {
							"-formatter",
							"include_document_start=true,drop_merge_tag=true,eof_newline=true,trim_trailing_whitespace=true,max_line_length=80",
						},
					}),
					nb.diagnostics.golangci_lint,
					nb.formatting.prettierd,
					nb.code_actions.impl,
					nb.code_actions.refactoring,
					nb.diagnostics.hadolint,
				},
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*.go", "*.py", "*.sh", "*.lua", "*.json" },
				callback = function()
					vim.lsp.buf.format()
				end,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*.yml", "*.yaml" },
				callback = function()
					vim.cmd([[:silent g/\v#([^ ])/s//# \1]])
					vim.lsp.buf.format()
				end,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = { "*.sh" },
				callback = function()
					print("Saving .sh file")
					vim.lsp.buf.format()
				end,
			})
		end,
	},
}
