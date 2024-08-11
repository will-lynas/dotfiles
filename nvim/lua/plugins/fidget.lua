return {
	"j-hui/fidget.nvim",
	config = function()
		local notification_config = vim.deepcopy(require("fidget.notification").default_config)
		notification_config.icon = ""

		require("fidget").setup({
			notification = {
				override_vim_notify = true,
				configs = {
					default = notification_config,
				},
			},
		})

		vim.keymap.set(
			"n",
			"<leader>fh",
			[[:lua require("fidget").notification.show_history()<CR>]],
			{ desc = "Fidget History" }
		)
	end,
}
