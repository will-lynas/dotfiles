function cwd()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
end

function short_mode()
    return vim.api.nvim_get_mode().mode
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'material',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { short_mode },
    lualine_b = {'filename'},
    lualine_c = { cwd },
    lualine_x = { 'location'},
    lualine_y = { 'progress' },
    lualine_z = { 'branch', {'diff', colored=false} },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'filename'},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {{'diff', colored=false}},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
