return {
	"lervag/vimtex",
	lazy = false,
	config = function()
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_quickfix_open_on_warning = 0

		local augroup = vim.api.nvim_create_augroup("latexSettings", { clear = true })

		vim.api.nvim_create_autocmd("FileType", {
			group = augroup,
			pattern = "latex",
			callback = function()
				vim.opt_local.conceallevel = 0
			end,
		})
	end,
}
