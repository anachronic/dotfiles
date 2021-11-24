local cmp = require'cmp'
local snippy = require'snippy'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = nil,
    mapping = {
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif snippy.can_expand_or_advance() then
                snippy.expand_or_advance()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif snippy.can_jump(-1) then
                snippy.previous()
            end
        end, { "i", "s" }),

        ['<CR>'] = cmp.mapping.confirm({ select = true })
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
    }),
    experimental = {
        native_menu = false, -- no idea
        ghost_text = true, -- virtual text EVERYWHERE. It's SO useful
    }
})
