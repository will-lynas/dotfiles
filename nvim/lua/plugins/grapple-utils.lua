return {
	"will-lynas/grapple-utils.nvim",
	dependencies = {
		"cbochs/grapple.nvim",
	},
	config = function()
		local utils = require("grapple-utils")
		vim.keymap.set("n", "<leader>oe", utils.move_to_end, { desc = "Move To End" })
	end,
}
