return {
  {
    'neovim/nvim-lspconfig',
    config = function()
-- lua lsp
require('lspconfig').lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },  -- Указываем, что vim — это глобальная переменная
            },
            workspace = {
                library = vim.env.VIMRUNTIME,
                checkThirdParty = false,  -- Отключаем предупреждения о внешних библиотеках
		"${3rd}/luv/library"
            },
            telemetry = {
                enable = false,  -- Отключаем сбор телеметрии
            },
        },
    },
}
-- go lsp
      require'lspconfig'.gopls.setup({})
    end
  },
}

