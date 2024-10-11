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

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = capabilities
					server.on_attach = require("lsp_utils").on_attach
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})

		vim.keymap.set("n", "<leader>li", function()
			vim.cmd("LspInfo")
		end, { desc = "Info" })
	end,
}
