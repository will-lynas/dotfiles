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
    globalstatus = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
    }
  },
  sections = {
    lualine_a = { short_mode },
    lualine_b = { 'selectioncount' } ,
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'location' },
    lualine_z = { 'progress' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
      lualine_a = {},
      lualine_b = { {'tabs', mode=2} },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { {'buffers', icons_enabled=false, mode=3} },
      lualine_z = {}
  },
  winbar = {
      lualine_a = {  'branch' },
      lualine_b = { 'filename' },
      lualine_c = { cwd },
      lualine_x = { 'diagnostics' },
      lualine_y = { 'diff' },
      lualine_z = {}
  },
  inactive_winbar = {
      lualine_a = {},
      lualine_b = { 'filename' },
      lualine_c = {},
      lualine_x = { 'diagnostics' },
      lualine_y = { 'diff' },
      lualine_z = {}
  },
  extensions = {}
}
