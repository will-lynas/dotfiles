return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {},
	config = function()
		require("which-key").register({
			["<leader>p"] = { name = "Telescope", _ = "which_key_ignore" },
			["<leader>x"] = { name = "Execute", _ = "which_key_ignore" },
			["<leader>k"] = { name = "Keep Buffer", _ = "which_key_ignore" },
			["<leader>s"] = { name = "System Clipboard", _ = "which_key_ignore" },
			["<leader>h"] = { name = "Hunk", _ = "which_key_ignore" },
			["<leader>t"] = { name = "Toggle", _ = "which_key_ignore" },
			["<leader>l"] = { name = "LSP", _ = "which_key_ignore" },
			["<leader>d"] = { name = "Neotree", _ = "which_key_ignore" },
			["<leader>i"] = { name = "Tab", _ = "which_key_ignore" },
			["<leader>o"] = { name = "Grapple", _ = "which_key_ignore" },
		})
	end,
}
