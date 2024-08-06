return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").add({
			{ "<leader>z", group = "Lazy", mode = "nv" },
			{ "<leader>p", group = "Telescope", mode = "nv" },
			{ "<leader>x", group = "Execute", mode = "nv" },
			{ "<leader>k", group = "Keep Buffer", mode = "nv" },
			{ "<leader>s", group = "System Clipboard", mode = "nv" },
			{ "<leader>h", group = "Hunk", mode = "nv" },
			{ "<leader>t", group = "Toggle", mode = "nv" },
			{ "<leader>l", group = "LSP", mode = "nv" },
			{ "<leader>d", group = "Neotree", mode = "nv" },
			{ "<leader>i", group = "Tab", mode = "nv" },
			{ "<leader>o", group = "Grapple", mode = "nv" },
			{ "<leader>a", group = "Insert", mode = "nv" },
			{ "<leader>m", group = "Obsidian", mode = "nv" },
			{ "<leader>f", group = "Misc", mode = "nv" },
			{ "<leader>w", group = "MiniTest", mode = "nv" },
		})
	end,
}
