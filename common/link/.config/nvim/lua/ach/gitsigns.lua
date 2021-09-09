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
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,

        ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
        ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

        -- Text objects
        ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
        ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
    },
    watch_index = {
        interval = 1000
    },
    -- current_line_blame = false,
    -- current_line_blame_delay = 1000,
    -- current_line_blame_position = 'eol',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    use_internal_diff = true,  -- If luajit is present
}
