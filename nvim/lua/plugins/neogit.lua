return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		"sindrets/diffview.nvim",
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup({
			disable_hint = true,
			graph_style = "unicode",
			auto_show_console = false,
			remember_settings = false,
			console_timeout = 10000,
		})

		vim.keymap.set("n", ";", neogit.open, { desc = "Status" })
	end,
}
