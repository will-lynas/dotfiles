return {
	"echasnovski/mini.test",
	version = "*",
	config = function()
		require("mini.test").setup()

		vim.keymap.set("n", "<leader>wr", MiniTest.run, { desc = "Run All" })
		vim.keymap.set("n", "<leader>wf", MiniTest.run_file, { desc = "Run File" })
	end,
}
