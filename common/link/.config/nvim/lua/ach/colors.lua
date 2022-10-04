-- nvim-colorizer
local colorizer = require('colorizer')

colorizer.setup({
    -- Don't activate by default. Use <leader>mc
    filetypes = {},
})

vim.keymap.set('n', '<leader>mc', ':ColorizerToggle<CR>')

-- catppuccin
local catppuccin = require('catppuccin')
local palette = require('catppuccin.palettes').get_palette()

vim.g.catppuccin_flavour = 'mocha'

catppuccin.setup({
    dim_inactive = {
        enabled = true,
    },
    integrations = {
        vim_sneak = true,
        nvimtree = true,
        gitsigns = true,
        cmp = true,
        neogit = true,
        treesitter = true,
    },
})

vim.cmd('silent! colorscheme catppuccin')
