local M = {}

function M.on_attach(_, bufnr)
	vim.keymap.set("n", "<leader>lr", function()
		vim.notify("Restarting LSP ...")
		vim.cmd("LspRestart")
	end, { desc = "Restart" })

	vim.keymap.set("n", "<leader>la", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })

	vim.keymap.set({ "n", "v" }, "<leader>lc", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code Action" })

	vim.keymap.set(
		"n",
		"gd",
		require("telescope.builtin").lsp_definitions,
		{ buffer = bufnr, desc = "Goto Definition" }
	)
	vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { buffer = bufnr, desc = "Goto References" })
	vim.keymap.set(
		"n",
		"gi",
		require("telescope.builtin").lsp_type_definitions,
		{ buffer = bufnr, desc = "Goto Type Definition" }
	)
end

return M
