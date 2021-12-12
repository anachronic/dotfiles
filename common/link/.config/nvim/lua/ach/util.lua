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

function util.ts_folding()
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
end

return util
