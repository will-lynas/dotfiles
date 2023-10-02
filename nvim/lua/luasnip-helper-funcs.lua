local M = {}

M.ls = require("luasnip")
M.s = M.ls.snippet
M.sn = M.ls.snippet_node
M.t = M.ls.text_node
M.i = M.ls.insert_node
M.f = M.ls.function_node
M.d = M.ls.dynamic_node
M.fmt = require("luasnip.extras.fmt").fmt
M.fmta = require("luasnip.extras.fmt").fmta
M.rep = require("luasnip.extras").rep

function M.get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return M.sn(nil, M.i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return M.sn(nil, M.i(1, ''))
  end
end

function M.in_mathzone()
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end


return M
