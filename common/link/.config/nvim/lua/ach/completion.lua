local cmp = require('cmp')
local snippy = require('snippy')

local has_words_before = function()
    local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
        and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s')
            == nil
end

local select_next = cmp.mapping(function(fallback)
    if snippy.can_expand_or_advance() then
        snippy.expand_or_advance()
    elseif cmp.visible() then
        if #cmp.get_entries() == 1 then
            cmp.confirm({ select = true })
        else
            cmp.select_next_item()
        end
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

local accept_regardless = cmp.mapping(function(fallback)
    if cmp.visible() then
        cmp.confirm({ select = true })
    else
        fallback()
    end
end, { 'i', 's' })

local accept_if_selected = cmp.mapping(function(fallback)
    if not cmp.get_selected_entry() then
        fallback()
    else
        cmp.confirm()
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
        ['<Tab>'] = select_next,
        ['<S-Tab>'] = select_previous,

        ['<down>'] = select_next,
        ['<up>'] = select_previous,

        ['<C-y>'] = accept_regardless,
        ['<CR>'] = accept_if_selected,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'neorg' },
    }),
})
