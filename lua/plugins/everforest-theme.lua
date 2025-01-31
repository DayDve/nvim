return {
	{
  "neanias/everforest-nvim",
  config = function()
    require("everforest").setup({
      -- Your config here
    })
    require("everforest").load()
  end,

	}
}
