-- nvim-colorizer
local colorizer = require('colorizer')

colorizer.setup({
    -- Don't activate by default. Use <leader>mc
    filetypes = {},
})

vim.keymap.set('n', '<leader>mc', ':ColorizerToggle<CR>')

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
