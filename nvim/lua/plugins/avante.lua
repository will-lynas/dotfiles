return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	opts = {
		mappings = {
			submit = {
				insert = "<C-c>",
			},
			ask = "<leader>;a",
			edit = "<leader>;e",
			refresh = "<leader>;r",
			focus = "<leader>;f",
			toggle = {
				default = "<leader>;t",
				debug = "<leader>;d",
				hint = "<leader>;h",
				suggestion = "<leader>;s",
				repomap = "<leader>;R",
			},
		},
		files = {
			add_current = "<leader>;c",
		},
		hints = {
			enabled = false,
		},
	},
	build = "make",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-tree/nvim-web-devicons",
	},
}
