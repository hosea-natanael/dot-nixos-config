local catppuccin = require("catppuccin")
catppuccin.setup({
    flavour = "mocha",
    background = {
        dark = "mocha",
    },
})

vim.cmd.colorscheme("catppuccin")
