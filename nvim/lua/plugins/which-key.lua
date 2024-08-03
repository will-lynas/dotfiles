return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").add({
			{ "<leader>z", group = "Lazy" },
			{ "<leader>p", group = "Telescope" },
			{ "<leader>x", group = "Execute" },
			{ "<leader>k", group = "Keep Buffer" },
			{ "<leader>s", group = "System Clipboard" },
			{ "<leader>h", group = "Hunk" },
			{ "<leader>t", group = "Toggle" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>d", group = "Neotree" },
			{ "<leader>i", group = "Tab" },
			{ "<leader>o", group = "Grapple" },
			{ "<leader>a", group = "Insert" },
		})
	end,
}
