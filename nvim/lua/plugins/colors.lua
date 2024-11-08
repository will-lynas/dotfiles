return {
	"folke/tokyonight.nvim",
	dependencies = { "Mofiqul/dracula.nvim", "rebelot/kanagawa.nvim" },
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "moon",
		})

		pcall(require, "current-theme")
	end,
}
