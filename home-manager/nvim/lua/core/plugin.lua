-- bootstrap / auto-install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    -- lsp
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        }
    },

    -- theme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- others
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
    },
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-tree.lua",
    "lewis6991/gitsigns.nvim",
    "tpope/vim-fugitive",
    "numToStr/Comment.nvim",
    "windwp/nvim-autopairs",
}

local opts = {}

require("lazy").setup(plugins, opts)
