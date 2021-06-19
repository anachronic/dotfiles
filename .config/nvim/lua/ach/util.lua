local util = {}

function util.map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function util.plug(repository)
    vim.cmd("Plug '" .. repository .. "'")
end

return util
