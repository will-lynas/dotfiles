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
		})
	end,
}
