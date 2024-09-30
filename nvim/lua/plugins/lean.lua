local utils = require("utils")

return {
	"Julian/lean.nvim",
	event = { "BufReadPre *.lean", "BufNewFile *.lean" },

	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("lean").setup({
			lsp = {},
			mappings = true,
			infoview = {
				autoopen = false,
			},
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = { "*.lean" },
			callback = utils.strip_trailing_whitespace,
		})
	end,
}
