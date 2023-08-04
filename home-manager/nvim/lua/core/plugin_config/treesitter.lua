local ntreesitter = require('nvim-treesitter.configs')

ntreesitter.setup({
    ensure_installed = { "c", "lua", "vim", "javascript", "typescript", "go", "dockerfile" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
})
