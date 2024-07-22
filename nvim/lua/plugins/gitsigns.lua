return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup()

		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Preview" })
		-- These are backwards due to migrating from gitgutter
		vim.keymap.set("n", "<leader>hu", gitsigns.reset_hunk, { desc = "Undo" })
		vim.keymap.set("n", "<leader>hr", gitsigns.undo_stage_hunk, { desc = "Reset" })
		vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "Stage" })
		vim.keymap.set("v", "<leader>hs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage" })
		vim.keymap.set("n", "]h", function()
			gitsigns.nav_hunk("next")
		end, { desc = "Next Hunk" })
		vim.keymap.set("n", "[h", function()
			gitsigns.nav_hunk("prev")
		end, { desc = "Previous Hunk" })
		vim.keymap.set("n", "<leader>hb", function()
			gitsigns.blame_line({ full = true })
		end, { desc = "Blame" })
	end,
}
