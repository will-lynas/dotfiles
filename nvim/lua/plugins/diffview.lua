return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({
			enhanced_diff_hl = true,
			use_icons = false,
			show_help_hints = false,
		})
	end,
}
