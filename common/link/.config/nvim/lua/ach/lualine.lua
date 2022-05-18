local function relativepath()
    local path = vim.fn.expand('%')

    if path == '' then
        path = '[No Name]'
    end

    if vim.bo.modified then
        path = path .. '[+]'
    elseif vim.bo.modifiable == false or vim.bo.readonly then
        path = path .. '[RO]'
    end

    return path
end

require('lualine').setup({
    options = {
        theme = 'seoul256',
        section_separators = '',
        component_separators = '',
    },
    sections = {
        lualine_c = { relativepath },
    },
})
