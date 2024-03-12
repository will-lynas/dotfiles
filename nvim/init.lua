local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>pf", function()
				builtin.find_files({ find_command = { "rg", "--files", "--hidden", "-g", "!.git" } })
			end, { desc = "Files" })
			vim.keymap.set("n", "<leader>pc", function()
				builtin.find_files({ hidden = true, no_ignore = true, no_ignore_parent = true })
			end, { desc = "All Files" })
			vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "Git Files" })
			vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>px", function()
				builtin.live_grep({
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"-uu",
					},
				})
			end, { desc = "Live Grep All" })
			vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Buffers" })
			vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Help Tags" })
			vim.keymap.set("n", "<leader>pk", builtin.keymaps, { desc = "Keymaps" })
			vim.keymap.set("n", "<leader>pt", builtin.vim_options, { desc = "Options" })
			vim.keymap.set("n", "<leader>pm", builtin.man_pages, { desc = "Man pages" })
			vim.keymap.set("n", "<leader>pd", function()
				builtin.diagnostics({ bufnr = 0 })
			end, { desc = "Diagnostics" })
			vim.keymap.set("n", "<leader>pr", builtin.resume, { desc = "Resume Last State" })
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					italic = false,
				},
			})
			vim.cmd.colorscheme("rose-pine")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = "all",
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				disable = { "latex" },
				additional_vim_regex_highlighting = { "python" }, -- Fix for python indentation
			},
		},
	},
	{
		"nvim-treesitter/playground",
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup()

			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			vim.keymap.set("n", "<leader>pa", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Harpoon" })

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():append()
			end, { desc = "Add to Harpoon" })
			vim.keymap.set("n", "<leader>m", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Harpoon Menu" })

			vim.keymap.set("n", "<M-q>", function()
				harpoon:list():select(1)
			end, { desc = "Harpoon File 1" })
			vim.keymap.set("n", "<M-w>", function()
				harpoon:list():select(2)
			end, { desc = "Harpoon File 2" })
			vim.keymap.set("n", "<M-e>", function()
				harpoon:list():select(3)
			end, { desc = "Harpoon File 3" })
			vim.keymap.set("n", "<M-r>", function()
				harpoon:list():select(4)
			end, { desc = "Harpoon File 4" })
		end,
	},
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git Status (Fugitive)" })
			vim.keymap.set("n", "<leader>gb", function()
				vim.cmd.Git("blame")
			end, { desc = "Git Blame" })
			vim.keymap.set("n", "<leader>gp", function()
				vim.cmd.Git("push")
			end, { desc = "Git Push" })
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					map("gi", require("telescope.builtin").lsp_type_definitions, "[G]oto Type Definition")
					map("<F2>", vim.lsp.buf.rename, "Rename")
					map("K", vim.lsp.buf.hover, "Hover Documentation")
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			local servers = {
				gopls = {},
				pyright = {},
				rust_analyzer = {
					cmd = { "rustup", "run", "stable", "rust-analyzer" },
					settings = {
						["rust-analyzer"] = {
							check = {
								command = "clippy",
							},
						},
					},
				},
				lua_ls = {
					settings = {
						Lua = {
							runtime = { version = "LuaJIT" },
							workspace = {
								checkThirdParty = false,
								-- Tells lua_ls where to find all the Lua files that you have loaded
								-- for your neovim configuration.
								library = {
									"${3rd}/luv/library",
									unpack(vim.api.nvim_get_runtime_file("", true)),
								},
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				},
			}

			require("mason").setup()
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua",
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets
					-- This step is not supported in many windows environments
					-- Remove the below condition to re-enable on windows
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },
				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),

					-- Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					["<C-Space>"] = cmp.mapping.complete({}),

					-- Think of <c-l> as moving to the right of your snippet expansion.
					--  So if you have a snippet that's like:
					--  function $name($args)
					--    $body
					--  end
					--
					-- <c-l> will move you to the right of each of the expansion locations.
					-- <c-h> is similar, except moving you backwards.
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			notify_on_error = false,
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt" },
			},
		},
	},
	{
		"alexghergh/nvim-tmux-navigation",
		opts = {
			disable_when_zoomed = true, -- defaults to false
			keybindings = {
				left = "<C-h>",
				down = "<C-j>",
				up = "<C-k>",
				right = "<C-l>",
				last_active = "<C-\\>",
				next = "<C-Space>",
			},
		},
	},
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		config = function()
			require("leap").add_default_mappings()
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local function short_mode()
				return vim.api.nvim_get_mode().mode
			end

			local function maximize_status()
				return vim.t.maximized and "  " or ""
			end

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = true,
					refresh = {
						statusline = 100,
						tabline = 100,
						winbar = 100,
					},
				},
				sections = {
					lualine_a = { short_mode },
					lualine_b = { maximize_status },
					lualine_c = { "selectioncount" },
					lualine_x = {},
					lualine_y = { "location", "progress" },
					lualine_z = { "branch" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {
					lualine_a = {},
					lualine_b = { { "tabs", mode = 2 } },
					lualine_c = {},
					lualine_x = {},
					lualine_y = { { "buffers", icons_enabled = false, mode = 3 } },
					lualine_z = {},
				},
				winbar = {
					lualine_a = { { "filename", path = 1 } },
					lualine_b = {},
					lualine_c = {},
					lualine_x = { { "diagnostics", draw_empty = true } },
					lualine_y = { { "diff", draw_empty = true } },
					lualine_z = {},
				},
				inactive_winbar = {
					lualine_a = { { "filename", path = 1 } },
					lualine_b = {},
					lualine_c = {},
					lualine_x = { { "diagnostics", draw_empty = true } },
					lualine_y = { { "diff", draw_empty = true } },
					lualine_z = {},
				},
				extensions = {},
			})
		end,
	},
	{
		"airblade/vim-gitgutter",
		config = function()
			vim.opt.number = true
			vim.opt.relativenumber = true
		end,
	},
	{
		"declancm/maximize.nvim",
		opts = {},
	},
	{
		"lervag/vimtex",
		config = function()
			vim.cmd([[
            filetype plugin indent on
            syntax enable
            set conceallevel=0
            let g:vimtex_view_method = 'zathura'
            let g:vimtex_quickfix_open_on_warning = 0
            ]])
		end,
	},
	{
		"numToStr/Comment.nvim",
		lazy = false,
		opts = {},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})

			require("telescope").load_extension("noice")
			vim.keymap.set("n", "<leader>pn", function()
				require("noice").cmd("telescope")
			end, { desc = "Message History" })
		end,
	},
	{
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
				["<leader>g"] = { name = "Git", _ = "which_key_ignore" },
				["<leader>x"] = { name = "Execute", _ = "which_key_ignore" },
				["<leader>k"] = { name = "Keep Buffer", _ = "which_key_ignore" },
				["<leader>s"] = { name = "System Clipboard", _ = "which_key_ignore" },
				["<leader>h"] = { name = "Hunk", _ = "which_key_ignore" },
				["<leader>t"] = { name = "Toggle", _ = "which_key_ignore" },
			})
		end,
	},
})

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = ""

vim.g.netrw_banner = 0

--Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	pattern = { "*" },
	command = [[%s/\s\+$//e]],
})

vim.opt.mouse = "" -- Disable mouse

vim.keymap.set("n", "<leader>v", vim.cmd.Ex, { desc = "File Explorer" })

--Select text that was last pasted
vim.keymap.set("n", "gp", "`[v`]")

--Move around lines in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--Stop J moving cursor
vim.keymap.set("n", "J", "mzJ`z")

--Half-page and searching keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--Pasting over highlighted area preserves buffer
vim.keymap.set("x", "<leader>kp", [["_dp]], { desc = "Paste" })
--Delete without overwriting buffer
vim.keymap.set({ "n", "v" }, "<leader>kd", [["_d]])
vim.keymap.set({ "n", "v" }, "<leader>kD", [["_D]])

--Note - when you perform actions on the system clipboard, the results also get
--stored in the normal buffers, overwriting them

--Yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>sy", [["+y]])
vim.keymap.set("n", "<leader>sY", [["+Y]])
--Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>sp", [["+p]])
vim.keymap.set("n", "<leader>sP", [["+P]])
--Delete to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>sd", [["+d]])
vim.keymap.set("n", "<leader>sD", [["+D]])

--Make current file executable
vim.keymap.set("n", "<leader>xf", "<cmd>!chmod +x %<CR>", { silent = true })

--Stop highlighted after a search
vim.keymap.set("n", "<Esc>", function()
	vim.cmd("noh")
end)

--Run file with python
vim.keymap.set("n", "<leader>xp", function()
	vim.cmd("!python3.11 %")
end, { desc = "Python" })

-- Tab controls
vim.keymap.set("n", "<leader>n", function()
	vim.cmd("tabnew")
end, { desc = "New Tab" })
vim.keymap.set("n", "<M-1>", function()
	vim.cmd("silent! tabn 1")
end, { desc = "Tab 1" })
vim.keymap.set("n", "<M-2>", function()
	vim.cmd("silent! tabn 2")
end, { desc = "Tab 2" })
vim.keymap.set("n", "<M-3>", function()
	vim.cmd("silent! tabn 3")
end, { desc = "Tab 3" })
vim.keymap.set("n", "<M-4>", function()
	vim.cmd("silent! tabn 4")
end, { desc = "Tab 4" })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local function index(seq, elem)
	for i, v in ipairs(seq) do
		if v == elem then
			return i
		end
	end

	return nil
end

local function toggle_guide()
	local wc = "120"
	local cc = vim.opt.cc:get()
	local i = index(cc, wc)

	if i then
		table.remove(cc, i)
	else
		table.insert(cc, wc)
	end

	vim.opt.cc = cc
end

vim.keymap.set("n", "<leader>tc", toggle_guide, { desc = "Color Column" })

local function toggle_wrap()
	vim.opt.wrap = not vim.opt.wrap
end

vim.keymap.set("n", "<leader>tw", toggle_wrap, { desc = "Wrap" })

-- Turn off virtual text for diagnostics, but keep for anything more important
vim.diagnostic.config({
	underline = {
		severity = { max = vim.diagnostic.severity.INFO },
	},
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN },
	},
})
