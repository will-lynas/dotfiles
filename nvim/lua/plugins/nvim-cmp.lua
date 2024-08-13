return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"folke/lazydev.nvim",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"neovim/nvim-lspconfig",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local cmp = require("cmp")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,noinsert",
			},
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "path" },
				{ name = "nvim_lsp" },
				{ name = "lazydev" },
			},
			mapping = cmp.mapping.preset.insert({
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
			}),
		})
	end,
}
