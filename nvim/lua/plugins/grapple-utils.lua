return {
	dir = require("paths").dev .. "/grapple-utils.nvim/",
	dependencies = {
		"cbochs/grapple.nvim",
	},
	config = function()
		local utils = require("grapple-utils")
		vim.keymap.set("n", "<leader>oe", utils.move_to_end, { desc = "Move To End" })
		vim.keymap.set("n", "<leader>ou", utils.move_up, { desc = "Move One Up" })
		vim.keymap.set("n", "<leader>od", utils.move_down, { desc = "Move One Down" })
	end,
}
