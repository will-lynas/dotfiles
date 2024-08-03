return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	config = function()
		local grapple = require("grapple")
		grapple.setup({
			scope = "git_branch",
		})

		vim.keymap.set("n", "<leader>pa", function()
			vim.cmd("Telescope grapple tags")
		end, { desc = "Grapple" })

		vim.keymap.set("n", "<leader>ot", grapple.toggle, { desc = "Toggle Tag" })
		vim.keymap.set("n", "<leader>om", grapple.toggle_tags, { desc = "Tag Menu" })
		vim.keymap.set("n", "<leader>oc", grapple.toggle_scopes, { desc = "Scopes Menu" })
		vim.keymap.set("n", "<leader>or", grapple.reset, { desc = "Reset" })

		vim.keymap.set("n", "<leader>oa", function()
			require("grapple").select({ index = 1 })
		end, { desc = "1", silent = true })

		vim.keymap.set("n", "<leader>os", function()
			require("grapple").select({ index = 2 })
		end, { desc = "2", silent = true })

		vim.keymap.set("n", "<leader>od", function()
			require("grapple").select({ index = 3 })
		end, { desc = "3", silent = true })

		vim.keymap.set("n", "<leader>of", function()
			require("grapple").select({ index = 4 })
		end, { desc = "4", silent = true })
	end,
}
