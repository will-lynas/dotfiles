return {
	dir = require("paths").dev .. "/grapple-line.nvim",
	dependencies = {
		"cbochs/grapple.nvim",
	},
	opts = {
		number_of_files = 4,
		colors = {
			active = "lualine_a_normal",
			inactive = "lualine_a_inactive",
		},
		-- Accepted values:
		-- "unique_filename" shows the filename and parent directories if needed
		-- "filename" shows the filename only
		mode = "unique_filename",
		-- If a tag name is set, use that instead of the filename
		show_names = false,
		-- Accepted values:
		-- "none" - overflowing files are ignored
		-- "ellipsis" - if there are overflowing files an ellipsis will be shown
		overflow = "ellipsis",
	},
}
