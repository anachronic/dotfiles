local util = {}

function util.plug(package)
    vim.cmd('packadd ' .. package)
end

function util.indent(num)
    vim.bo.shiftwidth = num
    vim.bo.tabstop = num
end

function util.ts_folding()
    vim.wo.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
end

return util
