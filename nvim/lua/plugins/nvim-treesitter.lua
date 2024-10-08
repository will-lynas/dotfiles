return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "markdown", "markdown_inline" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				disable = { "latex" },
				additional_vim_regex_highlighting = { "python" },
			},
		})
	end,
}
