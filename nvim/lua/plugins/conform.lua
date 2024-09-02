return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			-- TODO: fix this disable
			---@diagnostic disable-next-line
			format_on_save = true,
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
				-- TODO: reduce repetition
				typescript = { "prettier" },
				javascript = { "prettier" },
				markdown = { "prettier" },
				json = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
			},
		})
		vim.keymap.set("n", "<leader>fc", function()
			vim.cmd("ConformInfo")
		end, { desc = "Conform Info" })
	end,
}
