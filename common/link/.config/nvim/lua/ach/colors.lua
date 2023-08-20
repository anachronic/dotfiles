-- nvim-colorizer
local colorizer = require('colorizer')

colorizer.setup({
    -- Don't activate by default. Use <leader>mc
    filetypes = {},
})

vim.keymap.set('n', '<leader>mc', ':ColorizerToggle<CR>')

-- catppuccin
local catppuccin = require('catppuccin')

vim.g.catppuccin_flavour = 'macchiato'

catppuccin.setup({
    transparent_background = true,
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
        fidget = true,
        telescope = true,
    },
})

vim.cmd('silent! colorscheme catppuccin')
