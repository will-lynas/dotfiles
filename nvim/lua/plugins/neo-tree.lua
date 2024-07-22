return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			default_component_configs = {
				file_size = {
					enabled = false,
				},
				type = {
					enabled = false,
				},
				last_modified = {
					enabled = false,
				},
				created = {
					enabled = false,
				},
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
		})
		vim.keymap.set("n", "<leader>dl", function()
			vim.cmd("Neotree current reveal")
		end, { desc = "Fullscreen" })
		vim.keymap.set("n", "<leader>dk", function()
			vim.cmd("Neotree toggle right reveal")
		end, { desc = "Right" })
		vim.keymap.set("n", "<leader>dj", function()
			vim.cmd("Neotree toggle right git_status")
		end, { desc = "Git Status" })
	end,
}
