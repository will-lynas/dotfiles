return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	branch = "0.1.x",
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local action_state = require("telescope.actions.state")
		local utils = require("utils")

		telescope.setup({
			pickers = {
				live_grep = {
					mappings = {
						i = { ["<c-f>"] = actions.to_fuzzy_refine },
					},
				},
			},
			defaults = {
				layout_strategy = "vertical",
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

		local function find_in_git_root()
			local git_root = utils.git_root_of_current_file()
			if git_root then
				builtin.find_files({ cwd = git_root })
			end
		end

		local function grep_in_git_root()
			local git_root = utils.git_root_of_current_file()
			if git_root then
				builtin.live_grep({ cwd = git_root })
			end
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
		map("<leader>pc", find_in_git_root, "Find in Git Root")
		map("<leader>pe", grep_in_git_root, "Grep in Git Root")
		map("<leader>pi", function()
			require("telescope.builtin").git_bcommits({
				attach_mappings = function(prompt_bufnr, _)
					actions.select_default:replace(function()
						actions.close(prompt_bufnr)
						local selection = action_state.get_selected_entry()
						vim.cmd("DiffviewOpen " .. selection.value .. "^.." .. selection.value)
					end)
					return true
				end,
			})
		end, "Buffer Commits")
	end,
}
