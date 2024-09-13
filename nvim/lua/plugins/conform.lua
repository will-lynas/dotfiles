local formatters = {
	lua = { "stylua" },
	rust = { "rustfmt" },
}

for _, filetype in ipairs({ "typescript", "javascript", "markdown", "json", "css", "html" }) do
	formatters[filetype] = { "prettier" }
end

return {
	"stevearc/conform.nvim",
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = formatters,
		})

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				local cursor_pos = vim.fn.getcurpos()
				vim.cmd("normal! gg=G")
				vim.fn.setpos(".", cursor_pos)
				conform.format({ bufnr = args.buf })
			end,
		})

		vim.keymap.set("n", "<leader>fc", function()
			vim.cmd("ConformInfo")
		end, { desc = "Conform Info" })
	end,
}
