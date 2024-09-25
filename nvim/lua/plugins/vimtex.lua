return {
	"lervag/vimtex",
	config = function()
		-- TODO: refactor to lua
		-- TODO: local scope these settings
		vim.cmd([[
            filetype plugin indent on
            syntax enable
            let g:vimtex_view_method = 'zathura'
            let g:vimtex_quickfix_open_on_warning = 0
            ]])

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
