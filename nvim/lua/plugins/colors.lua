return {
	"folke/tokyonight.nvim",
	dependencies = {
		{ "rose-pine/neovim", name = "rose-pine" },
		"Mofiqul/dracula.nvim",
		"rebelot/kanagawa.nvim",
		"navarasu/onedark.nvim",
	},
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "moon",
		})

		pcall(require, "current-theme")
	end,
}
