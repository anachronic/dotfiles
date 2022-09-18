-- colors
local catppuccin = require('catppuccin')

catppuccin.setup({
    integrations = {
        vim_sneak = true,
        nvimtree = true,
        gitsigns = true,
        cmp = true,
    },
})
vim.g.catppuccin_flavour = 'mocha'
vim.cmd('silent! colorscheme catppuccin')
