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
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = { short_mode },
    lualine_b = {'filename'},
    lualine_c = { cwd },
    lualine_x = { 'location', 'progress' },
    lualine_y = { 'diff' },
    lualine_z = { 'branch' },
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
