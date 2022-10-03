local cmp = require('cmp')
local snippy = require('snippy')

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
        and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
            == nil
end

local select_next = cmp.mapping(function(fallback)
    if snippy.can_expand_or_advance() then
        snippy.expand_or_advance()
    elseif cmp.visible() then
        cmp.select_next_item()
    elseif has_words_before() then
        cmp.complete()
    else
        fallback()
    end
end, { 'i', 's' })

local select_previous = cmp.mapping(function()
    if cmp.visible() then
        cmp.select_prev_item()
    elseif snippy.can_jump(-1) then
        snippy.previous()
    end
end, { 'i', 's' })

cmp.setup({
    -- don't preselect anything for me
    preselect = cmp.PreselectMode.None,
    completeopt = 'menuone,noselect,noinsert',
    snippet = {
        expand = function(args)
            snippy.expand_snippet(args.body)
        end,
    },
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<Tab>'] = select_next,
        ['<S-Tab>'] = select_previous,

        -- ['<C-j>'] = select_next,
        -- ['<C-k>'] = select_previous,

        ['<down>'] = select_next,
        ['<up>'] = select_previous,

        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'neorg' },
    }),
})
