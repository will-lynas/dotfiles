return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "moon",
		})
		-- This is probably not the best place for this
		require("current-theme")
	end,
}
