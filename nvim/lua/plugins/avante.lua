return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	build = ":AvanteBuild source=false",
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		"zbirenbaum/copilot.lua",
		"MeanderingProgrammer/render-markdown.nvim",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					use_absolute_path = true,
				},
			},
		},
	},
	config = function()
		require("avante").setup({
			mappings = {
				ask = "<leader>;a",
				edit = "<leader>;e",
				refresh = "<leader>;r",
				toggle = {
					debug = "<leader>;d",
					hint = "<leader>;h",
				},
				submit = {
					insert = "<C-c>",
				},
			},
			hints = {
				enabled = false,
			},
		})

		local avante_group = vim.api.nvim_create_augroup("AvanteSettings", {})

		vim.api.nvim_create_autocmd("FileType", {
			group = avante_group,
			pattern = { "Avante", "AvanteInput" },
			callback = function()
				vim.opt_local.breakindent = false
				vim.opt_local.wrap = true
			end,
		})
	end,
}
