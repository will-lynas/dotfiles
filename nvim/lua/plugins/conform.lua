local formatters = {
	lua = { "stylua" },
	rust = { "rustfmt" },
	go = { "gofmt" },
}

for _, filetype in ipairs({ "typescript", "javascript", "markdown", "json", "css", "html", "htmldjango" }) do
	formatters[filetype] = { "prettier" }
end

return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = formatters,
			-- FIXME:
			---@diagnostic disable-next-line
			format_on_save = true,
		})

		vim.keymap.set("n", "<leader>fc", function()
			vim.cmd("ConformInfo")
		end, { desc = "Conform Info" })
	end,
}
