return {
	"will-lynas/grapple-utils.nvim",
	dependencies = {
		"cbochs/grapple.nvim",
	},
	config = function()
		local grapple_utils = require("grapple-utils")

		vim.keymap.set("n", "<leader>oe", grapple_utils.move_to_end, { desc = "Move To End" })

		if grapple_utils["move_up"] then
			vim.keymap.set("n", "<leader>oh", grapple_utils.move_up, { desc = "Move Left" })
		end

		if grapple_utils["move_down"] then
			vim.keymap.set("n", "<leader>ol", grapple_utils.move_down, { desc = "Move Right" })
		end
	end,
}
