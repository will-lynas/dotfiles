return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = { "all" },
		sync_install = false,
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "python" }, -- Fix for python indentation
		},
	},
}
