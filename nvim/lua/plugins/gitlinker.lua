return {
	"ruifm/gitlinker.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local gitlinker = require("gitlinker")

		local git_link_opts = {
			keybind = "<leader>sg",
			desc = "Copy Git Link",
		}

		-- Workaround:
		-- If mappings is nil then the default mapping is used (bad)
		-- So we pass in a keybind and then immediately overwrite it
		gitlinker.setup({ mappings = git_link_opts.keybind })

		vim.keymap.set("n", git_link_opts.keybind, function()
			gitlinker.get_buf_range_url("n")
		end, { desc = git_link_opts.desc })
		vim.keymap.set("v", git_link_opts.keybind, function()
			gitlinker.get_buf_range_url("v")
		end, { desc = git_link_opts.desc })

		vim.keymap.set("n", "<leader>sr", function()
			gitlinker.get_repo_url()
		end, { desc = "Copy Git Repo" })

		vim.keymap.set("n", "<leader>fg", function()
			-- The inbuilt version of this doesn't work
			local url = gitlinker.get_repo_url({ action_callback = nil, print_url = false })
			os.execute('open "' .. url .. '"')
		end, { desc = "Open Git Repo in Browser" })
	end,
}
