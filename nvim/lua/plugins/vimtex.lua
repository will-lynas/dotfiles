return {
	"lervag/vimtex",
	config = function()
		-- TODO: refactor to lua
		-- TODO: local scope these settings
		vim.cmd([[
            filetype plugin indent on
            syntax enable
            set conceallevel=0
            let g:vimtex_view_method = 'zathura'
            let g:vimtex_quickfix_open_on_warning = 0
            ]])
	end,
}
