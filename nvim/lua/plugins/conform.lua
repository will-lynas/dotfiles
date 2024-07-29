return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			format_on_save = true,
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				typescript = { "prettier" },
				javascript = { "prettier" },
				markdown = { "prettier" },
				json = { "prettier" },
				css = { "prettier" },
			},
		})
	end,
}
