require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "pyright" },
}

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require("lspconfig").rust_analyzer.setup({
    cmd = {'rustup', 'run', 'stable', 'rust-analyzer'}
})

lsp.setup()

-- Turn off virtual text for diagnostics, but keep for anything more important
vim.diagnostic.config({
    underline = {
        severity = { max = vim.diagnostic.severity.INFO }
    },
    virtual_text = {
        severity = { min = vim.diagnostic.severity.WARN }
    }
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    preselect = "item",
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    mapping = {}
})
