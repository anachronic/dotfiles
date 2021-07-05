local util = {}

function util.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = opts end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function util.plug(repository)
    vim.cmd("Plug '" .. repository .. "'")
end

function util.indent(num)
    vim.bo.shiftwidth = 4
    vim.bo.tabstop = 4
end

return util
