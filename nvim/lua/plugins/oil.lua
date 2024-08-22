return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup()

		vim.keymap.set("n", "<leader>jo", require("oil").open, { desc = "Open" })
		vim.keymap.set("n", "<leader>jk", require("oil").close, { desc = "Close" })
		vim.keymap.set("n", "<leader>jd", function()
			require("oil").open(vim.fn.getcwd())
		end, { desc = "Open in CWD" })
	end,
}
