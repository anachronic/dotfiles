local util = {}

function util.map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then options = opts end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function util.plug(package)
    vim.cmd("packadd " .. package)
end

function util.indent(num)
    vim.bo.shiftwidth = num
    vim.bo.tabstop = num
end

return util
