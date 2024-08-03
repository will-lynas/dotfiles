return {
	dir = "~/dev/grapple-utils.nvim/",
	dependencies = {
		"cbochs/grapple.nvim",
	},
	config = function()
		local utils = require("grapple-utils")
		utils.setup()
		vim.keymap.set("n", "<leader>a", utils.test)
	end,
}
