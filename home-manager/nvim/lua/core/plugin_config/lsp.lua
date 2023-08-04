-- "lsp" configs
local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.preset("recommended")
lsp.ensure_installed({
    "gopls",
    "lua_ls",
    "pylsp",
})
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
})
lsp.setup()

-- "cmp" options
local cmp = require("cmp")

cmp.setup({
    preselect = "item",
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }
})

-- "keymaps" configs
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format)
