return {
	"declancm/maximize.nvim",
	config = function()
		require("maximize").setup()

		vim.keymap.set("n", "<leader>ts", require("maximize").toggle, { desc = "Fullscreen" })
	end,
}
