return {
	"folke/tokyonight.nvim",
	dependencies = {
		{ "rose-pine/neovim", name = "rose-pine" },
		"Mofiqul/dracula.nvim",
		"rebelot/kanagawa.nvim",
		"navarasu/onedark.nvim",
		{ "catppuccin/nvim", name = "catppuccin" },
		"Mofiqul/vscode.nvim",
		"scottmckendry/cyberdream.nvim",
	},
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "moon",
		})

		require("onedark").setup({
			style = "deep",
			lualine = {
				transparent = true,
			},
		})

		pcall(require, "current-theme")
	end,
}
