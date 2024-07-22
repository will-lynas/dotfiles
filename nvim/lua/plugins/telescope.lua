return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	branch = "0.1.x",
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local utils = require("utils")

		telescope.setup({
			pickers = {
				live_grep = {
					mappings = {
						i = { ["<c-f>"] = actions.to_fuzzy_refine },
					},
				},
			},
		})

		local rg_args = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		}

		local prompts = {
			find = "Find Files",
			find_all = "Find Files - All",
			grep = "Live Grep",
			grep_all = "Live Grep - All",
		}

		local function find()
			builtin.find_files({
				find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
			})
		end

		local function find_all()
			builtin.find_files({
				hidden = true,
				no_ignore = true,
				no_ignore_parent = true,
				prompt_title = prompts.find_all,
			})
		end

		local function grep_all()
			builtin.live_grep({
				vimgrep_arguments = {
					utils.join_arrays(rg_args, { "-uu" }),
				},
				prompt_title = prompts.grep_all,
			})
		end

		local function diagnostics()
			builtin.diagnostics({ bufnr = 0 })
		end

		local function map(keybind, func, desc)
			vim.keymap.set("n", keybind, func, { desc = desc })
		end

		map("<leader>pf", find, prompts.find)
		map("<leader>pF", find_all, prompts.find_all)
		map("<leader>ps", builtin.live_grep, prompts.grep)
		map("<leader>pS", grep_all, prompts.grep_all)
		map("<leader>pd", diagnostics, "Diagnostics")
		map("<leader>pg", builtin.git_files, "Git Files")
		map("<leader>pb", builtin.buffers, "Buffers")
		map("<leader>ph", builtin.help_tags, "Help Tags")
		map("<leader>pk", builtin.keymaps, "Keymaps")
		map("<leader>pt", builtin.vim_options, "Options")
		map("<leader>pm", builtin.man_pages, "Man pages")
		map("<leader>pr", builtin.resume, "Resume Last State")

		map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
		map("gr", require("telescope.builtin").lsp_references, "Goto References")
		map("gi", require("telescope.builtin").lsp_type_definitions, "Goto Type Definition")
	end,
}
