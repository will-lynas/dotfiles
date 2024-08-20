local paths = require("paths")

return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	event = {
		"BufReadPre " .. paths.obsidian.vault .. "/*.md",
		"BufNewFile " .. paths.obsidian.vault .. "/*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		-- Keymaps specified in keys can be used from anywhere
		-- Keymaps specified in opts can only be used when the plugin has been loaded
		{
			"<leader>md",
			function()
				vim.cmd("ObsidianToday")
			end,
			desc = "Go to daily note",
		},
		{
			"<leader>mn",
			function()
				local filename = vim.fn.input("Enter filename: ")
				vim.cmd("ObsidianNew " .. filename)
			end,
			desc = "New",
		},
		{
			"<leader>mt",
			function()
				vim.cmd("ObsidianTags")
			end,
			desc = "Tags",
		},
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = paths.obsidian.vault,
			},
		},
		daily_notes = {
			folder = paths.obsidian.daily,
		},
		completion = {
			min_chars = 1,
		},
		mappings = {
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			["<leader>mb"] = {
				action = function()
					vim.cmd("ObsidianBacklinks")
				end,
				opts = { desc = "Backlinks" },
			},
			["<leader>ml"] = {
				action = function()
					vim.cmd("ObsidianLinks")
				end,
				opts = { desc = "Links" },
			},
			["<leader>mo"] = {
				action = function()
					vim.cmd("ObsidianOpen")
				end,
				opts = { desc = "Open in Obsidian" },
			},
			["<leader>mr"] = {
				action = function()
					vim.cmd("ObsidianRename")
				end,
				opts = { desc = "Rename" },
			},
		},

		wiki_link_func = "use_alias_only",

		note_path_func = function(spec)
			local path = spec.dir / spec.title
			return path:with_suffix(".md")
		end,

		new_notes_location = "notes_subdir",

		note_id_func = function(title)
			return title
		end,

		open_app_foreground = true,
	},
}
