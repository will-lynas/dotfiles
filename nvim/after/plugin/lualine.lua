local function cwd()
    return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
end

local function short_mode()
    return vim.api.nvim_get_mode().mode
end

local function maximize_status()
  return vim.t.maximized and '  ' or ''
end

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
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
    lualine_b = { maximize_status } ,
    lualine_c = { 'selectioncount' },
    lualine_x = {},
    lualine_y = { 'location', 'progress' },
    lualine_z = { 'copilot', 'branch' },
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
      lualine_a = { {'filename', path=1} },
      lualine_b = {},
      lualine_c = {},
      lualine_x = { {'diagnostics', draw_empty=true} },
      lualine_y = { {'diff', draw_empty=true} },
      lualine_z = {}
  },
  inactive_winbar = {
      lualine_a = { {'filename', path=1} },
      lualine_b = {},
      lualine_c = {},
      lualine_x = { {'diagnostics', draw_empty=true} },
      lualine_y = { {'diff', draw_empty=true} },
      lualine_z = {}
  },
  extensions = {}
}
