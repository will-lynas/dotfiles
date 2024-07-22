return {
	"j-hui/fidget.nvim",
	config = function()
		local notification_config = vim.deepcopy(require("fidget.notification").default_config)
		notification_config.icon = ""
		notification_config.ttl = 16

		require("fidget").setup({
			notification = {
				override_vim_notify = true,
				configs = {
					default = notification_config,
				},
			},
		})
	end,
}
