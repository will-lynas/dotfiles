return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		require("mason").setup()

		local servers = {
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
			tailwindcss = {
				filetypes = { "html", "htmldjango", "css", "javascript", "typescript" },
			},
		}

		local function on_attach(_, bufnr)
			vim.keymap.set("n", "<leader>lr", function()
				vim.notify("Restarting LSP ...")
				vim.cmd("LspRestart")
			end, { desc = "Restart" })

			vim.keymap.set("n", "<leader>la", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover Documentation" })

			vim.keymap.set(
				{ "n", "v" },
				"<leader>lc",
				vim.lsp.buf.code_action,
				{ buffer = bufnr, desc = "Code Action" }
			)

			vim.keymap.set(
				"n",
				"gd",
				require("telescope.builtin").lsp_definitions,
				{ buffer = bufnr, desc = "Goto Definition" }
			)
			vim.keymap.set(
				"n",
				"gr",
				require("telescope.builtin").lsp_references,
				{ buffer = bufnr, desc = "Goto References" }
			)
			vim.keymap.set(
				"n",
				"gi",
				require("telescope.builtin").lsp_type_definitions,
				{ buffer = bufnr, desc = "Goto Type Definition" }
			)
		end

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = capabilities
					server.on_attach = on_attach
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})

		vim.keymap.set("n", "<leader>li", function()
			vim.cmd("LspInfo")
		end, { desc = "Info" })
	end,
}
