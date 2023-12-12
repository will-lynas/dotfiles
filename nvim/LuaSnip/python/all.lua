local h = require('luasnip-helper-funcs')

return {
    h.s(
    {
        trig=";vp",
        snippetType = "autosnippet"
    },
    h.fmta([[
    #!/usr/bin/env python3.11
    ]],
    {}
    ),
    {}
    ),
    h.s(
    {
        trig=";db",
        snippetType = "autosnippet"
    },
    h.fmta([[
    def debugger(func):
        def inner(*args, **kwargs):
            out = func(*args, **kwargs)
            print(args, kwargs, out)
            return out
        return inner
    ]],
    {}
    ),
    {}
    ),

}
