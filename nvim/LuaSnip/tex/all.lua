local h = require('luasnip-helper-funcs')

return {
    -- ########################################################################
    h.s(
    {
        trig="tp",
        description="template"
    },
    h.fmta([[
    \documentclass{article}
    \usepackage[left=3cm,right=3cm,top=0cm,bottom=2cm]{geometry}
    \usepackage{amsmath}

    \setlength{\parindent}{0mm}

    \begin{document}

    \title{<>}
    \author{<>}
    \date{\today}
    \maketitle

    <>

    \end{document}
    ]],
    {
        h.i(1),
        h.i(2, "Will Lynas"),
        h.i(0)
    }
    ),
    {}
    ),

    -- ########################################################################
    h.s(
    {
        trig = "ff",
        snippetType = "autosnippet"
    },
    h.fmta([[
    \frac{<>}{<>}
    ]],
    {
        h.i(1),
        h.i(2)
    }
    ),
    {condition = h.in_mathzone}
    )
}
