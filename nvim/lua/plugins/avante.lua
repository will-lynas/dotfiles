return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	build = "make",
	opts = {
		mappings = {
			ask = "<leader>;a",
			edit = "<leader>;e",
			refresh = "<leader>;r",
			toggle = {
				debug = "<leader>;d",
				hint = "<leader>;h",
			},
		},
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}
