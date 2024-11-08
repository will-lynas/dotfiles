return {
	"folke/tokyonight.nvim",
	dependencies = { "Mofiqul/dracula.nvim" },
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "moon",
		})

		require("dracula").setup()

		pcall(require, "current-theme")
	end,
}
