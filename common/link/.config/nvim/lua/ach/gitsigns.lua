-- require('gitsigns').setup()
require('gitsigns').setup {
    signs = {
        add          = { hl = 'GitGutterAdd'          , text = '┃' , numhl='' },
        change       = { hl = 'GitGutterChange'       , text = '┃' , numhl='' },
        delete       = { hl = 'GitGutterDelete'       , text = '_' , numhl='' },
        topdelete    = { hl = 'GitGutterDelete'       , text = '‾' , numhl='' },
        changedelete = { hl = 'GitGutterChangeDelete' , text = '≃' , numhl='' },
    },
    numhl = false,
    linehl = false,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil,
    on_attach = function(bufnr)
        local gitsigns = package.loaded.gitsigns

        vim.keymap.set('n', '<leader>gd', gitsigns.preview_hunk, { buffer = bufnr })
        vim.keymap.set('n', ']h', gitsigns.next_hunk, { buffer = bufnr })
        vim.keymap.set('n', '[h', gitsigns.prev_hunk, { buffer = bufnr })
        vim.keymap.set({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { buffer = bufnr })
    end
}
