return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"will-lynas/grapple-line.nvim",
	},
	config = function()
		local function short_mode()
			return vim.api.nvim_get_mode().mode
		end

		local function maximize_status()
			return vim.t.maximized and "  " or ""
		end

		require("lualine").setup({
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
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
				lualine_c = {},
				lualine_x = {},
				lualine_y = { "progress" },
				lualine_z = { { "branch", icons_enabled = false } },
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
				lualine_a = { { "tabs", mode = 2, max_length = 2 * vim.o.columns / 3 } },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { require("grapple-line").status },
			},
			winbar = {
				lualine_a = {},
				lualine_b = { { "filename", path = 1 } },
				lualine_c = {},
				lualine_x = { { "diagnostics", draw_empty = true } },
				lualine_y = { { "diff", draw_empty = true } },
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = { { "filename", path = 1 } },
				lualine_c = {},
				lualine_x = { { "diagnostics", draw_empty = true } },
				lualine_y = { { "diff", draw_empty = true } },
				lualine_z = {},
			},
		})
	end,
}
