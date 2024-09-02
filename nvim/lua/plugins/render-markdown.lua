return {
	"MeanderingProgrammer/render-markdown.nvim",
	-- TODO: make this work on cmp docs
	ft = { "markdown", "Avante" },
	opts = {
		-- TODO: do something about this circular dep
		file_types = { "markdown", "Avante" },
		-- TODO: highlighting is messed up for headings, so this is disabled for the moment
		heading = {
			enabled = false,
		},
		code = {
			sign = false,
			style = "normal",
			border = "thick",
		},
		bullet = {
			right_pad = 1,
		},
		link = {
			image = "",
			email = "",
			hyperlink = "",
		},
		pipe_table = {
			style = "normal",
		},
	},
}
